{ config, ... }: {

    boot.loader = {
        efi.canTouchEfiVariables = true;
        timeout = 5;
        systemd-boot = {
            enable = true;
            configurationLimit = 5;
        };
    };
}
