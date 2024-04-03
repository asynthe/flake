{ config, lib, ... }: {

    networking.hostName = "thinkpad";
    system.stateVersion = "23.11";
    nixpkgs.config.allowUnfree = lib.mkForce true;
    nixpkgs.config.allowUnfreePredicate = (_: true);
    i18n.defaultLocale = "en_US.UTF-8";
    time.timeZone = "Australia/Perth";

    imports = [
        ./hardware.nix
        ./modules.nix
    ];
}
