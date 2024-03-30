{ config, pkgs, ... }: {

    boot.loader = {
        systemd-boot.enable = true;
        systemd-boot.configurationLimit = 7;
	timeout = 5;
        efi.canTouchEfiVariables = true;
    };
}
