{ lib, ... }: {

    networking.hostName = "thinkpad";
    system.stateVersion = "23.11";
    nixpkgs.config.allowUnfree = lib.mkForce true;
    time.timeZone = "Australia/Perth";

    # Boot
    system.boot.banner = "simple_cat"; # simple_cat, hentai

    # System
    system.laptop.users.enable = true;
    #system.users = "laptop" or "server";

    # Language
    language.english.enable = true; 
    # system.language = "english";
    # system.language = "japanese";

    # Services
    services = {
        #endlessh.enable = true;
        #grafana.enable = true;
        qbittorrent-nox.enable = true;
        ssh.enable = true;
        ssh.configuration = "laptop";
        sshfs.enable = true;
    };

    # Ports IN PROGRESS
    #services.ssh.port = 2001;
    #services.grafana.port = 2002;
    #services.service1.port = 2002;
    #services.service2.port = 2002;

    imports = [
        ./hardware.nix
        ./modules.nix
        ../../profiles
    ];
}
