{ config, lib, ... }:
with lib;
let
    persistence_type = config.meta.disk.persistence.type;
in {
    disko.devices = {

        # tmpfs if persistence is enabled.
	    nodev."/" = mkIf (persistence_type == "tmpfs") {
	        fsType = "tmpfs";
	        mountOptions = [ "size=2G" "defaults" "mode=0755" ];
	    };

        disk.main = {
            device = config.meta.disk.device;
            type = "disk";

            content = {
                type = "gpt";
                partitions = {
            
		        # Boot partition
		        boot = {
		            priority = 1;
		            name = "boot";
		            size = "512M";
		            type = "EF00";
			        content.type = "filesystem";
			        content.format = "vfat";
			        content.mountpoint = "/boot";
		        };

                # Main partition
		        data = {
		            size = "100%";
			        content.type = "btrfs";
			        content.subvolumes = {

			            home.type = "filesystem";
			            home.mountpoint = "/home";
			            home.mountOptions = [ "compress=zstd" ];

			            nix.type = "filesystem";
			            nix.mountpoint = "/nix";
			            nix.mountOptions = [ "compress=zstd" ];

			            persist.type = "filesystem";
			            persist.mountpoint = "/persist";
			            persist.mountOptions = [ "compress=zstd" ];

			            log.type = "filesystem";
			            log.mountpoint = "/var/log";
			            log.mountOptions = [ "compress=zstd" ];
			        };
		        };
            };
	    };
        };
    };
}
