{ config, pkgs, ... }: {

    boot.loader = {
        systemd-boot.enable = true;
        systemd-boot.configurationLimit = 7;
	timeout = 5;
        efi.canTouchEfiVariables = true;
    };

    boot.tmp.cleanOnBoot = true;
    #boot.tmp.useTmpfs = true;
    #boot.tmp.tmpfsSize = "20%"; # default `"50%"`.
}
