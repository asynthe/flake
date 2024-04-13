{ inputs, ... }: {

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
