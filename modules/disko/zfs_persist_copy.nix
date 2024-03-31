# This is an independent module which extracts the shared configuration for the zpool portion of a disko-based
# impermanent zfs disk partition scheme. All that is required in addition is the configuration of the disks
# themeselves which should be coupled with the specific host configuration

{ inputs, pkgs, l, ... }:

{
  imports = [
    inputs.disko.nixosModules.disko
    inputs.impermanence.nixosModules.impermanence
  ];

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

  environment.systemPackages = [ pkgs.zfs-prune-snapshots ];

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

  services.zfs = {
    autoScrub.enable = true;
    trim.enable = true;
  };

  systemd.services.zfs-mount.enable = false;

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
      keylocation =
        "file:///tmp/secret.key"; # NOTE must be set during initial installation step
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
        options = {
          canmount = "off";
          mountpoint = "none";
          reservation = "5GiB";
        };
        type = "zfs_fs";
      };
      # TODO Impermanence home?
      home = {
        type = "zfs_fs";
        options.mountpoint = "legacy";
        mountpoint = "/home";
        options."com.sun:auto-snapshot" = "true";
        postCreateHook = "zfs snapshot rpool/home@empty";
      };
      persist = {
        type = "zfs_fs";
        options.mountpoint = "legacy";
        mountpoint = "/persist";
        options."com.sun:auto-snapshot" = "true";
        postCreateHook = "zfs snapshot rpool/persist@empty";
      };
      nix = {
        type = "zfs_fs";
        options.mountpoint = "legacy";
        mountpoint = "/nix";
        options = {
          atime = "off";
          canmount = "on";
          "com.sun:auto-snapshot" = "true";
        };
        postCreateHook = "zfs snapshot rpool/nix@empty";
      };
      root = {
        type = "zfs_fs";
        options.mountpoint = "legacy";
        mountpoint = "/";
        postCreateHook = ''
          zfs snapshot rpool/root@empty
          zfs snapshot rpool/root@lastboot
        '';
      };
    };
  };
}
