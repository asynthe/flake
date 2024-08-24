{ config, lib, ... }: {

    boot = {
        supportedFilesystems = [ "btrfs" "vfat" ];
        #resumeDevice = "/dev/disk/by-label/nixos";
        initrd.luks.devices."encrypted".allowDiscards = true;
    };

    # MOVE TO IMPERMANENCE
    security.sudo.extraConfig = ''
      # rollback results in sudo lectures after each reboot
      Defaults lecture = never
    '';

    # -------------------------------------------------
    # IMPERMANENCE - disk.persistence.type = "snapshots";

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

    disko.devices = lib.mkForce {

        # Root tmpfs for Impermanence.
        nodev =
        if (config.meta.disk.persistence.type == "tmpfs") then { 
            "/" = { fsType = "tmpfs"; mountOptions = [ "size=4G" "defaults" "mode=755" ]; }; 
        }
        else { 
            "/tmp" = { fsType = "tmpfs"; mountOptions = [ "size=2G" ]; }; 
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
                        content.name = config.meta.disk.encryption.device_name;
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

                            # TEST - Snapshots Impermanence
                            # TEST AFTER INSTALL?
                            #postCreateHook = /* sh */ ''
						      #MNTPOINT=$(mktemp -d)
							  #mount "/dev/mapper/encrypted" "$MNTPOINT" -o subvol=/
							  #trap 'umount $MNTPOINT; rm -rf $MNTPOINT' EXIT
							  #btrfs subvolume snapshot -r $MNTPOINT/root $MNTPOINT/root-blank
						    #'';

                            subvolumes = {

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
    };
}
