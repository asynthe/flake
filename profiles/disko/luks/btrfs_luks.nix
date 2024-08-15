{ config, ... }: {

    # -------------------------------------------------
    # Other configuration

    boot = {
        supportedFilesystems = [ "btrfs" "vfat" ];
        #resumeDevice = "/dev/disk/by-label/nixos";
        initrd.luks.devices."encrypted".allowDiscards = true;
    };

    security.sudo.extraConfig = ''
      # rollback results in sudo lectures after each reboot
      Defaults lecture = never
    '';

    # Specific banner or message on decryption.
    #imports = [ ./luks/banner/message.nix ];
    boot.initrd.luks.devices."encrypted".preLVM = true; # encrypted <- Make it be an option !!!

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
    # Snapshots configuration

    # This didn't seem to work (with nixos-anywhere)
    # as you have to manually create the first snapshot.
    # Maybe it works in some way.

    #boot.initrd = {
        #postDeviceCommands = lib.mkAfter ''
          #mkdir /mnt
          #mount -t btrfs /dev/mapper/cryptroot
          #btrfs subvolume delete /mnt/root
          #btrfs subvolume snapshot /mnt/root-blank /mnt/root
        #'';
    #};

    # -------------------------------------------------
    # Disko configuration

    # THIS SETS UP [DISKO] THE SYSTEM FOR IMPERMANENCE   
    # BUT IT DOESNT SET UP SNAPSHOTS NOR ROOT TMPFS
    # THOSE WILL BE ADDED AS OPTIONS IN THE FUTURE

    disko.devices = {

        # Root tmpfs for Impermanence.
        nodev."/" = {
	        fsType = "tmpfs";
	        mountOptions = [ 
                "size=4G"
		        "defaults"
		        "mode=0755"
	        ];
	    };

        # Main disk
        disk.main = {
            device = config.meta.system.disk.device;
            type = "disk";
            content = {
                type = "gpt";
                partitions = {
            
		            # EFI partition
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

                    # LUKS
                    luks = {
                        size = "100%";
                        label = "luks";
                        content.type = "luks";
                        content.name = "encrypted"; # OPTION !
                        content.settings = {
                            allowDiscards = true; # SSD optimization
                            bypassWorkqueues = true; # SSD optimization
                        };
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
                            extraArgs = [ "-f" ];
                            subvolumes = {

                                # Swap
                                #"/swap" = {
                                    #mountpoint = "/swap";
                                    #swap.swapfile.size = "16G"; # SWAP FILE SIZE OPTION
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
    };
}
