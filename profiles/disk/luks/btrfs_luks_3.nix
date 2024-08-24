{ config, ... }: {

    boot = {
        supportedFilesystems = [ "btrfs" "vfat" ];
        #resumeDevice = "/dev/disk/by-label/nixos";
        #initrd.luks.devices."encrypted".allowDiscards = true;
    };

    security.sudo.extraConfig = ''
      # rollback results in sudo lectures after each reboot
      Defaults lecture = never
    '';

    # Specific banner or message on decryption.
    imports = [ ./banner/cat.nix ];
    #boot.initrd.luks.devices."encrypted".preLVM = true; # encrypted <- Make it be an option !!!

    # FILE?
	fileSystems."/persist".neededForBoot = true;

    # DISKO TEST!!!
    disko.devices.disk = {

        sda.type = "disk";
        sda.device = config.meta.system.disk.device;
        sda.content.type = "gpt";
        sda.content.partitions = {

            # ESP / Boot
            esp = {
                priority = 1;
                start = "1M";
                end = "512M";
                type = "EF00";
                content.type = "filesystem";
                content.format = "vfat";
                content.mountpoint = "/boot";
			    content.mountOptions = [ "umask=0077" ];
			    content.extraArgs = [ "-n NIXBOOT" ];
            };

            # Encrypted LUKS + btrfs
            root = {
                size = "100%";
			    content.type = "luks";
			    content.name = "crypted";
			    content.settings.allowDiscards = true;
                content.content.type = "btrfs";
                content.content.extraArgs = [ "-f" "-L NIXROOT"]; 
			    content.content.postCreateHook = /* sh */ ''
                  MNTPOINT=$(mktemp -d)
                  mount "/dev/mapper/crypted" "$MNTPOINT" -o subvol=/
                  trap 'umount $MNTPOINT; rm -rf $MNTPOINT' EXIT
                  btrfs subvolume snapshot -r $MNTPOINT/root $MNTPOINT/root-blank
			    '';
                content.content.subvolumes = {

			        "/root" = {
                        mountpoint = "/";
                        mountOptions = [ "compress=zstd" "noatime" ];
                    };

                    "/nix" = {
                        mountpoint = "/nix";
                        mountOptions = [ "compress=zstd" "noatime" ];
                    };

                    "/persist" = {
                        mountpoint = "/persist";
                        mountOptions = [ "compress=zstd" "noatime" ];
                    };

                    "/swap" = {
                        mountpoint = "/.swapvol";
					    mountOptions = [ "noatime" ];
                        swap.swapfile.size = "20M";
                    };
                };
            };
        };
    };
}
