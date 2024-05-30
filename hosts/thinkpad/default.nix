{ lib, ... }: {

    networking.hostName = "thinkpad";
    system.stateVersion = "23.11";
    nixpkgs.config.allowUnfree = lib.mkForce true;
    time.timeZone = "Australia/Perth";

    # Custom configuration
    system.laptop.users.enable = true;
    boot.banner.enable = true;
    #boot.banner = "simple_cat";
    language.english.enable = true;
    services.qbittorrent-nox.enable = true;
    services.sshfs.enable = true;

    imports = [
        ./hardware.nix
        ./modules.nix
        ../options.nix
    ];
}
