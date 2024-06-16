{ lib, ... }: {

    networking.hostName = "thinkpad";
    system.stateVersion = "23.11";
    nixpkgs.config.allowUnfree = lib.mkForce true;
    time.timeZone = "Australia/Perth";

    # System configuration
    system = {
        nix.settings = "laptop"; # laptop, server
        nix.cache = true;
        users = "laptop";
        locale = "both"; # Change to system.language?
        networking.type = "laptop";
    };

    boot = {
        banner = "simple_cat"; # simple_cat, hentai
        bootloader = "systemd-boot";
        cleantmp = true;
        silent = false;
    };

    audio = {
        pipewire = true;
        musnix = false;
    };

    gaming = {
        steam = true;
        gamemode = true;
    };

    # Disk
    disk.ssd = true;

    # Services
    services = { # configuration? daemon?
        #android.enable = true;
        #docker.enable = true;
        #endlessh.enable = true;
        #flatpak.enable = true;
        #grafana.enable = true;
        #i2pd.enable = true;
        #locate.enable = true;
        qbittorrent-nox.enable = true;
        #sql.enable = true;
        ssh.enable = true;
        ssh.configuration = "laptop"; # laptop, server
        sshfs.enable = true;
        #syncthing.enable = true;
        #wine.enable = true;
        #xmr.enable = true;
    };

    # Ports !!! IN PROGRESS
    #services = {
        #ssh.port = 2001;
        #grafana.port = 2002;
        #service1.port = 2002;
        #service2.port = 2002;
    #};
}
