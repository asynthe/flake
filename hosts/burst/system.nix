{
    # SET DEVICE HERE system.device = ?
    # SET USERNAME HERE system.username = ?
    # system.hostname = config.networking.hostName;

    networking.hostName = "burst"; # Hostname
    networking.networkmanager.enable = true;
    system.stateVersion = "24.11";
    nixpkgs.config.allowUnfree = true;
    i18n.defaultLocale = "en_US.UTF-8";
    time.timeZone = "Australia/Perth";

    # To move
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Options
    # options for secureboot -> system.secureboot = true;
}
