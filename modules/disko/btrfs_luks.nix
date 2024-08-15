{ config, ... }: {

    imports = [ ./btrfs_snapshots.nix ./persistence.nix ];

    security.sudo.extraConfig = ''
      # rollback results in sudo lectures after each reboot
      Defaults lecture = never
    '';

    # -------------------------------------------------
    # Hibernation mode test

    # To hibernate the PC using the created swap, add the next to boot configuration.
    # Check how to calculate the swap file offset.
    # https://wiki.archlinux.org/title/Power_management/Suspend_and_hibernate#Acquire_swap_file_offset
    #boot = {
        #kernelParams = [ "resume_offset=533760" ];
        #resumeDevice = "/dev/disk/by-label/nixos";
    #};

    # -------------------------------------------------
    # THIS SETS UP [DISKO] THE SYSTEM FOR IMPERMANENCE   
    # BUT IT DOESNT SET UP SNAPSHOTS NOR ROOT TMPFS
    # THOSE WILL BE ADDED AS OPTIONS IN THE FUTURE

    disko.devices = {
        # ROOT TMPFS FOR IMPERMANENCE
        #nodev."/" = {
	        #fsType = "tmpfs";
	        #mountOptions = [ 
                #"size=2G"
		        #"defaults"
		        #"mode=0755"
	        #];
	    #};

        # Main disk
        disk.main = {
            device = config.meta.system.disk.device;
            type = "disk";
            content = {
                type = "gpt";
                partitions = {
            
		            # Boot partition
		            boot = {
		                label = "boot";
                        name = "ESP";
		                size = "512M";
		                type = "EF00";
			            content.type = "filesystem";
			            content.format = "vfat";
			            content.mountpoint = "/boot";
			            content.mountOptions = [ "defaults" ];
		            };

                    # LUKS STARTS HERE
                    luks = {
                        size = "100%";
                        label = "luks";
                        content.type = "luks";
                        content.name = "cryptroot";
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

                        content.content = {
                            type = "btrfs";
                            #extraArgs = [ "-f" ];
                            extraArgs = [ "-L" "nixos" "-f" ];
                            subvolumes = {

                                # Swap
                                #"/swap" = {
                                    #mountpoint = "/swap";
                                    #swap.swapfile.size = "16G"; # SWAP FILE SIZE OPTION
                                #};

                                # Subvolumes
                                "/root" = {
                                    mountpoint = "/";
                                    mountOptions = [ "subvol=root" "compress=zstd" "noatime" ];
                                };

                                "/home" = {
                                    mountpoint = "/home";
                                    mountOptions = [ "subvol=root" "compress=zstd" "noatime" ];
                                };

                                "/nix" = {
                                    mountpoint = "/nix";
                                    mountOptions = [ "subvol=root" "compress=zstd" "noatime" ];
                                };

                                "/persist" = {
                                    mountpoint = "/persist";
                                    mountOptions = [ "subvol=root" "compress=zstd" "noatime" ];
                                };

                                "/log" = {
                                    mountpoint = "/var/log";
                                    mountOptions = [ "subvol=root" "compress=zstd" "noatime" ];
                                };
                            };  
                        };
                    };
                };
            };
        };
    };
}
