{ device, pkgs, ... }: {

    # bcachefs doesn't support impermanence because there is no
    # subvolume support yet. (╥﹏╥)

    boot.supportedFilesystems = [ "bcachefs" ];
    boot.initrd.supportedFilesystems = [ "bcachefs" "vfat" ];
    boot.kernelPackages = pkgs.linuxPackages_testing; # required for bcachefs?

    #environment.systemPackages = builtins.attrValues {
        #inherit (pkgs)
            #bcachefs-tools
        #;
    #};

    disko.devices.disk.main = {
        device = "${device}";
        type = "disk";
        content = {
            type = "gpt";
            partitions = {
                ESP.type = "EF00";
                ESP.size = "512M";
                ESP.content.type = "filesystem";
                ESP.content.format = "vfat";
                ESP.content.mountpoint = "/boot";
                ESP.content.mountOptions = [
                    "defaults"
                    "umask=0077"
                ];
                
                # swap? zram?
                #swap.size = "2G";
                #swap.type = "8200";
                #swap.content.type = "swap";
                
                # encrypted swap?
                #cryptoswap.size = "16GB";
                #cryptoswap.content.type = "swap";
                #cryptoswap.content.randomEncryption = true;
                #cryptoswap.content.priority = 100; # Encrypt as long as there is space.
                
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
