{ device, ... }: {

    boot.supportedFilesystems = [ "bcachefs" ];
    disko.devices.disk.main = {

        device = "${device}";
        type = "disk";
        content = {
            type = "gpt";
            partitions = {
                ESP.type = "EF00";
                ESP.size = "500M";
                ESP.content.type = "filesystem";
                ESP.content.format = "vfat";
                ESP.content.mountpoint = "/boot";

                # REPLACE for zram?
                #swap.size = "2G";
                #swap.type = "8200";
                #swap.content.type = "swap";

                root.name = "root";
                root.end = "-0"; # Same as size = "100%"
                root.content.type = "filesystem";
                root.content.format = "bcachefs";
                root.content.mountpoint = "/";

                # Options to mkfs.bcachefs
                root.content.extraArgs = [
                    #"-f" # force, not needed
                    "--compression=lz4"
                    "--discard" # TRIM support
                    #"--encrypted"
                ];

                # Options to mount command and to fileSystems.<name>.options
                mountOptions = [
                    "defaults"
                    "compression=lz4"
                    "discard"
                    #"relatime"
                    #"nodiratime"
                ];
            };
        };
    };
}
