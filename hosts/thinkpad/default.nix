{ lib, ... }: {

    # The system imprint.
    networking.hostName = "thinkpad";
    system.stateVersion = "23.11";
    nixpkgs.config.allowUnfree = lib.mkForce true;
    i18n.defaultLocale = "en_US.UTF-8";
    time.timeZone = "Australia/Perth";

    # Custom configuration.
    language.english.enable = true;

    imports = [
        ./hardware.nix
        ./modules.nix
    ];
}
