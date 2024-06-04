{
    boot.loader = {
        efi.canTouchEfiVariables = true;
        timeout = 5;
        systemd-boot.enable = true;
        systemd-boot.configurationLimit = 5;
    };
}
