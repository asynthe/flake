{ device, ... }: {

    disko.devices = {

        # tmpfs
	nodev."/" = {
	    fsType = "tmpfs";
	    mountOptions = [
	        "size=${tmpfsSize}"
		"defaults"
		"mode=755"
	    ];
	};

        # Main disk
        disk.main = {
            device = "${device}";
            type = "disk";
            content = {
                type = "gpt";
                partitions = {

		    # Boot partition
		    # /dev/disk/by-partlabel/disk-main-boot
		    boot.name = "boot";
		    boot.size = "1M";
		    boot.type = "EF02";

                    # ESP
		    # /dev/disk/by-partlabel/disk-main-ESP
                    ESP.type = "EF00";
                    ESP.size = "512M";
                    ESP.content.type = "filesystem";
                    ESP.content.format = "vfat";
                    ESP.content.mountpoint = "/boot";
                   
                    # Swap
                    #swap.type = "8200";
                    #swap.size = "2G";
                    #swap.content.type = "swap";
                    
                    # Root partition
		    # /dev/disk/by-partlabel/disk-main-root
                    root.name = "root";
                    root.size = "100%";
                    root.content.type = "luks";
                    root.content.name = "crypt";
                    root.content.extraOpenArgs = [ "--allow-discards" ];
                    root.content.askPassword = true;
                    root.content.initrdUnlock = true;
                    root.content.content.type = "filesystem";
                    root.content.content.format = "ext4";
                    root.content.content.mountpoint = "/nix";
                    root.content.content.mountOptions = [ "defaults" ];
                };
	    };
        };
    };
}
