{ pkgs, ... }: {

    boot = {
        initrd.systemd.enable = true;
	    loader.efi.canTouchEfiVariables = true;
	    tmp.cleanOnBoot = true;
    };
    programs.fuse.userAllowOther = true;
    security.sudo.extraConfig = ''
      # rollback results in sudo lectures after each reboot
      Defaults lecture = never
    '';

    environment.systemPackages = builtins.attrValues {
        inherit (pkgs)
            testdisk testdisk-qt
            extundelete
            ext4magic
        ;
    };

    # Remember this copies files from /persist to where specified.
    environment.persistence."/persist" = {
        directories = [
	        "/etc/NetworkManager/system-connections"
	        "/etc/nixos"
	        "/var/lib/bluetooth"
	        "/var/lib/nixos"
	        "/var/lib/systemd/coredump"
	        "/var/lib/tailscale"
	        "/var/log"
	        "/tmp"
	    ];
        files = [
	        "/etc/machine-id"
	    ];
    };

    fileSystems = {
        "/persist".neededForBoot = true;
        "/var/log".neededForBoot = true;
    };
}
