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

    environment.systemPackages = builtins.attrValues { inherit (pkgs) zfs-prune-snapshots; };
    systemd.services.zfs-mount.enable = false;
    services.zfs = {
        autoScrub.enable = true;
        trim.enable = true;
    };

    fileSystems."/" = {
        device = "tmpfs";
	fsType = "tmpfs";
	neededForBoot = true;
	options = [
	    "defaults"
	    "size=2G"
	    "mode=755"
	];
    };

    fileSystems."/persist".neededForBoot = true;
    environment.persistence."/persist" = {
        directories = [
            "/var/log"
            "/var/db/sudo"
            "/var/lib/bluetooth"
            "/var/lib/nixos"
            "/var/lib/systemd/coredump"
            "/etc/NetworkManager/system-connections"
        ];
        files = [
            "/etc/machine-id"
        ];
    };
}
