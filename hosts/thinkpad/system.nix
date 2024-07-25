{ lib, ... }: {

    networking.hostName = "thinkpad";
    system.stateVersion = "23.11";
    nixpkgs.config.allowUnfree = lib.mkForce true;
    time.timeZone = "Australia/Perth";

    /* Options to create
    system.virtualization = [ "libvirt" "virtualbox" "vmware" ];
    */

    # System configuration
    system.configuration = {
        type = "laptop";
        user = "ben";
        disk = "/dev/nvme0n1";
        language = "both"; # english, japanese, both
    };

    system = {
        #locale = "both"; # -> system.configuration.language
        networking.type = "laptop"; # -> Enabled with system.configuration.type
        users = "laptop"; # -> Enabled with system.configuration.type
        nix.settings = "laptop"; # -> Enabled with system.configuration.type
        nix.cache = true; # Enable by default on the same file.
        # -------------------------------------------------
        keyboard = true;
        ssd = true;
    };

    boot = {
        banner = "simple_cat"; # simple_cat, hentai
        bootloader = "systemd-boot";
        cleantmp = true;
        silent = false;
    };

    #driver = {
        #intel.enable = true;
        #nvidia.enable = true;
    #};

    audio = {
        bluetooth = true;
        musnix = false;
        pipewire.enable = true;
        pipewire.lowlatency = true;
    };

    #gaming = {
        #steam = true;
        #gamemode = true;
        #controller = true;
    #};

    # Services
    services = { # configuration? daemon?
        #android.enable = true;
        docker.enable = true;
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
