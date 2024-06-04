{
    networking.hostName = "server";
    system.stateVersion = "23.11";
    nixpkgs.config.allowUnfree = true;
    i18n.defaultLocale = "en_US.UTF-8";
    time.timeZone = "Australia/Perth";

    # Options
    system.server.users.enable = true;

    language.english.enable = true; 
    # system.language = "english";
    # system.language = "japanese";

    services = {
        #grafana.enable = true;
        qbittorrent-nox.enable = true;
        ssh.enable = true;
        ssh.configuration = "server";
        sshfs.enable = true;
    };

    imports = [
        ./modules.nix
	    ./hardware.nix
        ../../profiles
    ];
}
