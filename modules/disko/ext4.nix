{ device, ... }: {

    disko.devices = {

        # Main disk
        disk.main = {
            device = "${device}";
            type = "disk";
            content = {
                type = "gpt";
                partitions = {
            
		    # Boot partition
		    boot.name = "boot";
		    boot.size = "1M";
		    boot.type = "EF02";

                    # ESP
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
                    root.size = "100%";
                    root.content.type = "filesystem";
                    root.content.format = "ext4";
                    root.content.mountpoint = "/";

                };
	    };
        };
    };
}
