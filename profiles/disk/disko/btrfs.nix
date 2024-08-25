{ config, lib, ... }:
with lib;
let
    cfg = config.meta.disk;
in {
    #config = mkIf (cfg.filesystem == "btrfs") {
    boot = {
        supportedFilesystems = [ "btrfs" "vfat" ];
        #resumeDevice = "/dev/disk/by-label/nixos";

        # encryption enabled !
        #initrd.luks.devices."encrypted".allowDiscards = true;
    };

    disko.devices = {

        # Impermanent main tmpfs partition.
        # tmpfs if persistence is enabled.
        #nodev."/" = mkIf cfg.persistence.enable {
        nodev."/" = mkIf config.meta.disk.persistence.enable {
	        fsType = "tmpfs";
	        mountOptions = [ "size=2G" "defaults" "mode=0755" ];
	    };

        # Main disk
        disk.main = {
            #device = cfg.device;
            device = config.meta.disk.device;
            type = "disk";
            content = {
                type = "gpt";
                partitions = {
            
		        # EFI partition
		        boot = {
		            priority = 1;
		            name = "boot";
                    #label = "boot";
		            size = "512M";
		            type = "EF00";
			        content.type = "filesystem";
			        content.format = "vfat";
			        content.mountpoint = "/boot";
			        content.mountOptions = [ "defaults" ];
		        };

                # Main partition - non-encrypted Impermanence
		        #data = mkIf cfg.persistence.enable {
		        #    size = "100%";
			    #    content.type = "btrfs";
			    #    content.subvolumes = {
                #
			    #        home.type = "filesystem";
			    #        home.mountpoint = "/home";
			    #        home.mountOptions = [ "compress=zstd" ];
                #
			    #        nix.type = "filesystem";
			    #        nix.mountpoint = "/nix";
			    #        nix.mountOptions = [ "compress=zstd" ];
                #
			    #        persist.type = "filesystem";
			    #        persist.mountpoint = "/persist";
			    #        persist.mountOptions = [ "compress=zstd" ];
                #
			    #        log.type = "filesystem";
			    #        log.mountpoint = "/var/log";
			    #        log.mountOptions = [ "compress=zstd" ];
			    #    };
		        #};

                # Main partition - Impermanence + LUKS encrypted
                #main = mkIf cfg.persistence.enable {
                main = mkIf config.meta.disk.encryption.enable {
                    size = "100%";
                    label = "luks";
                    content.type = "luks";
                    content.name = "encrypted"; # This is the name of /dev/mapper device
                    content.settings.allowDiscards = true; # SSD optimization
                    content.settings.bypassWorkqueues = true; # SSD optimization
                    content.extraOpenArgs = [
                        #"--allow-discards"
                        #"--perf-no_read_workqueue"
                        #"--perf-no_write_workqueue"
                        "--timeout 10"
                    ];

                    # Cipher options and more
                    #content.extraFormatArgs = [
                        #"--type luks2"
                        #"--cipher aes-xts-plain64"
                        #"--hash sha512"
                        #"--iter-time 5000"
                        #"--key-size 256"
                        #"--pbkdf argon2id"
                        # Use true random data from /dev/random, block until enough entropy is available.
                        #"--use-random"
                    #];

                    content.content.type = "btrfs";
                    content.content.extraArgs = [ "-f" ];
                    content.content.subvolumes = {

                            # Swap
                            # If config.meta.system.disk.swap then
                            #"/swap" = {
                                #mountpoint = "/swap";
                                #swap.swapfile.size = config.meta.system.disk.swap;
                            #};

                            # Subvolumes
                            "/" = {
                                mountpoint = "/btr_pool";
                                mountOptions = [ "subvolid=5" ];
                            };

                            "/nix" = {
                                mountpoint = "/nix";
                                mountOptions = [ "compress=zstd" "noatime" ];
                                #mountOptions = [ "subvol=root" "compress=zstd" "noatime" ];
                            };

                            "/snapshots" = {
                                mountpoint = "/snapshots";
                                mountOptions = [ "compress=zstd" "noatime" ];
                                #mountOptions = [ "subvol=root" "compress=zstd" "noatime" ];
                            };

                            "/home" = {
                                mountpoint = "/home";
                                mountOptions = [ "compress=zstd" "noatime" ];
                                #mountOptions = [ "subvol=root" "compress=zstd" "noatime" ];
                            };

                            "/persist" = {
                                mountpoint = "/persist";
                                mountOptions = [ "compress=zstd" "noatime" ];
                                #mountOptions = [ "subvol=root" "compress=zstd" "noatime" ];
                            };

                            "/log" = {
                                mountpoint = "/var/log";
                                mountOptions = [ "compress=zstd" "noatime" ];
                                #mountOptions = [ "subvol=root" "compress=zstd" "noatime" ];
                            };
                        };  
                    };
                };
	        };
        };
    };
}
