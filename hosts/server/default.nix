{
    networking.hostName = "server";
    system.stateVersion = "23.11";
    nixpkgs.config.allowUnfree = true;
    i18n.defaultLocale = "en_US.UTF-8";
    time.timeZone = "Australia/Perth";

    # Options
    system.server.users.enable = true;
    services.qbittorrent-nox.enable = true;

    imports = [
        ./modules.nix
	    ./hardware.nix
        ../options.nix

        # To move to ../options.nix once optionized.
        ../../profiles/ssh
        ../../profiles/user
        ../../profiles/vpn
    ];
}
