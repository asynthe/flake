{ config, device, inputs, ... }: {

    # Remember this copies files from /persist to where specified.
    environment.persistence."/persist" = {
        directories = [
	    "/etc/NetworkManager/system-connections"
	    "/etc/nixos"
	    "/tmp"
	    "/var/lib/bluetooth"
	    "/var/lib/nixos"
	    "/var/lib/systemd/coredump"
	    "/var/lib/tailscale"
	    "/var/log"
	];
        files = [
	    "/etc/machine-id"
	];
    };

    fileSystems = {
        "/persist".neededForBoot = true;
        "/var/log".neededForBoot = true;
    };

    security.sudo.extraConfig = ''
      # rollback results in sudo lectures after each reboot
      Defaults lecture = never
    '';

    programs.fuse.userAllowOther = true;

    boot = {
        initrd.systemd.enable = true;
	loader.efi.canTouchEfiVariables = true;
	tmp.cleanOnBoot = true;
    };
}
