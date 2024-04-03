{ config, lib, ... }: {

    # The system imprint.
    networking.hostName = "thinkpad";
    system.stateVersion = "23.11";
    nixpkgs.config.allowUnfree = lib.mkForce true;
    i18n.defaultLocale = "en_US.UTF-8";
    time.timeZone = "Australia/Perth";

    imports = [
        ./hardware.nix
        ./modules.nix
    ];
}
