{ lib, ... }: {

    networking.hostName = "thinkpad";
    system.stateVersion = "23.11";
    nixpkgs.config.allowUnfree = lib.mkForce true;
    time.timeZone = "Australia/Perth";

    # Custom configuration
    language.english.enable = true;

    imports = [
        ./hardware.nix
        ./modules.nix
    ];
}
