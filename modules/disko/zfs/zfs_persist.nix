{ config, pkgs, inputs, ... }: {

    networking.hostId = "9d408e4d";
    boot = {
        kernelParams = [ "nohibernate" "zfs.zfs_arc_max=17179869184" ];
        supportedFilesystems = [ "vfat" "zfs" ];
        zfs = {
	        devNodes = "/dev/disk/by-id/";
                forceImportAll = true;
                requestEncryptionCredentials = true;
        };
        initrd.postDeviceCommands = ''
        zfs rollback -r rpool/root@empty
        '';
    };

    systemd.services.zfs-mount.enable = false;
    services.zfs = {
        autoScrub.enable = true;
        trim.enable = true;
    };
    environment.systemPackages = builtins.attrValues { inherit (pkgs) zfs-prune-snapshots; };
}
