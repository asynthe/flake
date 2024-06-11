{ lib, ... }: {

    networking.hostName = "thinkpad";
    system.stateVersion = "23.11";
    nixpkgs.config.allowUnfree = lib.mkForce true;
    time.timeZone = "Australia/Perth";

    # System configuration
    system.boot.banner = "simple_cat"; # simple_cat, hentai
    system.nix.settings = "laptop"; # laptop, server
    system.nix.cache = true;
    system.audio.pipewire = true;
    #system.audio.musnix = true;

    system.laptop.users.enable = true; # !!! change to system.users = "laptop" or "server";
    language.english.enable = true; # !!! Change to system.language = "english"; (english, spanish, japanese)

    # Services
    services = {
        #endlessh.enable = true;
        #grafana.enable = true;
        qbittorrent-nox.enable = true;
        ssh.enable = true;
        ssh.configuration = "laptop";
        sshfs.enable = true;
    };

    # Ports 
    # !!! IN PROGRESS
    #services.ssh.port = 2001;
    #services.grafana.port = 2002;
    #services.service1.port = 2002;
    #services.service2.port = 2002;
}
