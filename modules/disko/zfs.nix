{
    # -------------------------------------------------
    # ZFS
    # -------------------------------------------------

    #networking.hostId = "3a864bd3"; # Random 8 digits, required
    #boot = {
        # Only latest compatible kernel stuff with ZFS.
        #kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages; 
        #kernelParams = [ "nohibernate" "zfs.zfs_arc_max=17179869184" ];
        #supportedFilesystems = [ "vfat" "zfs" ];
    #};

    #services.zfs = {
        #trim.enable = true;
        #autoScrub = {
            #enable = true;
            #pools = ["nixpool"];
        #};
    #};

    systemd.services.zfs-mount.enable = false;
    environment.systemPackages = builtins.attrValues {
        inherit (pkgs)
            sanoid
            zfs-prune-snapshots
        ;
    };


    # ENCRYPT.NIX, ZFS_ENCRYPTED.NIX (?)
    #boot.initrd.luks.devices = {
        #crypt = {
        #device = "/dev/disk/by-uuid/2fd0b0d6-7c7f-461d-8ba6-d6aa6d3a2401";
        #preLVM = true;
        #};
    #};

    #boot.initrd.luks.devices."crypt".device = "/dev/disk/by-uuid/eb79a748-75bc-41d6-9b74-df1726965260";
  #boot.initrd.luks.devices."crypt".preLVM = true;
  #boot.initrd.availableKernelModules = ["aesni_intel" "cryptd"];
  #boot.initrd.cryptoModules = [ "aes" "aes_generic" "blowfish" "twofish" "serpent" "cbc" "xts" "lrw" "sha1" "sha256" "sha512" "af_alg" "algif_skcipher" ];

# This is an independent module which extracts the shared configuration for the zpool portion of a disko-based
# impermanent zfs disk partition scheme. All that is required in addition is the configuration of the disks
# themeselves which should be coupled with the specific host configuration

  boot = {
    initrd.postDeviceCommands = l.mkAfter ''
      zfs rollback -r rpool/root@empty
    '';
    kernelParams = [ "nohibernate" "zfs.zfs_arc_max=17179869184" ];
    supportedFilesystems = [ "vfat" "zfs" ];
    zfs = {
      devNodes = "/dev/disk/by-id/";
      forceImportAll = true;
      requestEncryptionCredentials = true;
    };
  };

  # Partitions
  #fileSystems = {
    #"/" = {
      #device = "nixpool/root/nixos";
      #fsType = "zfs";
    #};
    #"/home" = {
      #device = "nixpool/home";
      #fsType = "zfs";
    #};
  #};

        zfs = {
	        devNodes = "/dev/disk/by-id/";
                forceImportAll = true;
                requestEncryptionCredentials = true;
        };
        initrd.postDeviceCommands = ''
        zfs rollback -r rpool/root@empty
        '';
    };


  fileSystems."/persist".neededForBoot = true;

  # TODO Generalize this somewhere?
  environment.persistence."/persist" = {
    files = [
      "/etc/machine-id"
      "/etc/ssh/ssh_host_ed25519_key"
      "/etc/ssh/ssh_host_ed25519_key.pub"
    ];
    directories = [
      "/var/log"
      "/var/db/sudo"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
      "/etc/NetworkManager/system-connections"
    ];
  };

    # -------------------------------------------------
    # DISKO
    # -------------------------------------------------

    disko.devices.zpool.rpool = {
        type = "zpool";
        postCreateHook = ''
          zfs set keylocation="prompt" $name;
        '';
        options.ashift = "12";
        options.autotrim = "on";
        rootFsOptions = {
            acltype = "posixacl";
            canmount = "off";
            checksum = "edonr";
            compression = "zstd";
            dnodesize = "auto";
            mountpoint = "none";
            normalization = "formD";
            relatime = "on";
            xattr = "sa";
            "com.sun:auto-snapshot" = "false";

            # Password as a passphrase.
            keyformat = "passphrase";
            encryption = "aes-256-gcm";
            
            # Password as a key.
            #keylocation = "file:///tmp/secret.key"; # NOTE must be set during initial installation step
        };

        datasets = {

        # In case a dataset becomes full.
            reserved.type = "zfs_fs";
            reserved.options.canmount = "off";
            reserved.options.mountpoint = "none";

            home.type = "zfs_fs";
            home.mountpoint = "/home";
            home.options.mountpoint = "legacy";
            home.options."com.sun:auto-snapshot" = "true";
            home.postCreateHook = "zfs snapshot rpool/home@empty";

            persist.type = "zfs_fs";
            persist.mountpoint = "/persist";
            persist.options.mountpoint = "legacy";
            persist.options."com.sun:auto-snapshot" = "true";
            persist.postCreateHook = "zfs snapshot rpool/persist@empty";

            nix.type = "zfs_fs";
            nix.mountpoint = "/nix";
            nix.options.mountpoint = "legacy";
            nix.options.atime = "off";
            nix.options.canmount = "on";
            nix.options."com.sun:auto-snapshot" = "true";
            nix.options.postCreateHook = "zfs snapshot rpool/nix@empty";

            root.type = "zfs_fs";
            root.mountpoint = "/";
            root.options.mountpoint = "legacy";
            root.postCreateHook = ''
              zfs snapshot rpool/root@empty
              zfs snapshot rpool/root@lastboot
            '';
        };
    };
}

    # -------------------------------------------------
    # DISKO 2
    # -------------------------------------------------
    disko.devices.zpool.rpool = {
        type = "zpool";
        rootFsOptions = {
            acltype = "posixacl";
            canmount = "off";
            checksum = "edonr";
            compression = "zstd";
            dnodesize = "auto";
            encryption = "aes-256-gcm";
            keyformat = "passphrase";
            keylocation = "file:///tmp/secret.key"; # NOTE must be set during initial installation step
            mountpoint = "none";
            normalization = "formD";
            relatime = "on";
            xattr = "sa";
            "com.sun:auto-snapshot" = "false";
        };
        options = {
            ashift = "12";
            autotrim = "on";
        };
        postCreateHook = ''
          zfs set keylocation="prompt" $name;
        '';

        datasets = {
        # NOTE In the case a dataset becomes full, this is leeway to fix the problem
            reserved = {
                type = "zfs_fs";
                options = {
                    canmount = "off";
                    mountpoint = "none";
                    reservation = "5GiB";
                };
            };
      
        # TODO Impermanence home?
        home = {
            type = "zfs_fs";
            mountpoint = "/home";
            options.mountpoint = "legacy";
            options."com.sun:auto-snapshot" = "true";
            postCreateHook = "zfs snapshot rpool/home@empty";
        };

        persist = {
            type = "zfs_fs";
            mountpoint = "/persist";
            options.mountpoint = "legacy";
            options."com.sun:auto-snapshot" = "true";
            postCreateHook = "zfs snapshot rpool/persist@empty";
        };

        nix = {
            type = "zfs_fs";
            mountpoint = "/nix";
            postCreateHook = "zfs snapshot rpool/nix@empty";
            options.mountpoint = "legacy";
            options.atime = "off";
            options.canmount = "on";
            options."com.sun:auto-snapshot" = "true";
        };

        root = {
            type = "zfs_fs";
            mountpoint = "/";
            options.mountpoint = "legacy";
            postCreateHook = ''
              zfs snapshot rpool/root@empty
              zfs snapshot rpool/root@lastboot
            '';
        };
    };
}
