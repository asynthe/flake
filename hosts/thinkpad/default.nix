{ lib, ... }: {

    networking.hostName = "thinkpad";
    system.stateVersion = "23.11";
    nixpkgs.config.allowUnfree = lib.mkForce true;
    time.timeZone = "Australia/Perth";

    # Options
    system.laptop.users.enable = true;
    #system.users = "laptop" or "server";

    #boot.banner.enable = true; # simple_cat, hentai
    boot.banner = "simple_cat";

    language.english.enable = true; 
    # system.language = "english";
    # system.language = "japanese";

    # Services
    services = {
        qbittorrent-nox.enable = true;
        ssh.enable = true;
        ssh.configuration = "laptop";
        sshfs.enable = true;
    };

    # Ports IN PROGRESS
    #services.ssh.port = 2001;
    #services.grafana.port = 2002;

    imports = [
        ./hardware.nix
        ./modules.nix
        ../options.nix
    ];
}
