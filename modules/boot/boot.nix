{
    boot.loader = {
	    timeout = 5;
        systemd-boot.enable = true;
        systemd-boot.configurationLimit = 4;
        efi.canTouchEfiVariables = true;
    };

    # MOVE - disko, impermanence
    boot.tmp = {
        cleanOnBoot = true;
        #useTmpfs = true;
        #tmpfsSize = "20%"; # default `"50%"`.
    };
}
