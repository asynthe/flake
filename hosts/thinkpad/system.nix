{
    networking.hostName = "thinkpad";
    system.stateVersion = "23.11";
    nixpkgs.config.allowUnfree = true;
    time.timeZone = "Australia/Perth";

    /* Options to create
    system.virtualization = [ "libvirt" "virtualbox" "vmware" ];
    */

    framework = {
        # -------------- System - Main --------------
        system.type = "laptop";
        system.user = "ben";
        #system.disk = "/dev/nvme0n1";
        system.language = "both"; # english, japanese, both

        # -------------- System - Other --------------
        system.keyboard = true;
        system.ssd = true;
        
        # Set up by `framework.system.type`.
        #system.locale = "both"; # -> system.configuration.language
        system.networking.type = "laptop"; # -> Enabled with system.configuration.type
        system.users = "laptop"; # -> Enabled with system.configuration.type
        system.nix.settings = "laptop"; # -> Enabled with system.configuration.type
        system.nix.cache = true; # Enable by default on the same file.

        # -------------- Boot --------------
        boot.banner = "simple_cat"; # simple_cat, hentai
        boot.bootloader = "systemd-boot";
        boot.cleantmp = true;
        boot.silent = false;

        # -------------- Driver --------------
        #driver.displaylink = true;
        #driver.nvidia.enable = true;
        #driver.nvidia.cache = true;

        # -------------- Audio --------------
        audio.bluetooth = true;
        audio.musnix = false;
        audio.pipewire.enable = true;
        audio.pipewire.lowlatency = true;

        # -------------- Gaming --------------
        #gaming.steam = true;
        #gaming.gamemode = true;
        #gaming.controller = true;

        # -------------- Services --------------
        #services.android.enable = true;
        #services.docker.enable = true;
        #services.endlessh.enable = true;
        #services.flatpak.enable = true;
        #services.grafana.enable = true;
        #services.i2pd.enable = true;
        #services.locate.enable = true;
        services.qbittorrent-nox.enable = true;
        #services.sql.enable = true;
        services.ssh.configuration = "laptop"; # laptop, server
        services.ssh.enable = true;
        services.sshfs.enable = true;
        #services.syncthing.enable = true;
        #services.wine.enable = true;
        #services.xmr.enable = true;

        # -------------- Services - Ports --------------
        #services.ssh.port = 2001;
        #services.grafana.port = 2002;
        #services.service1.port = 2002;
        #services.service2.port = 2002;
    };
}
