{
    imports = [

        # Secrets
        ../../secrets/secrets.nix

        # Disk configuration
	    ../../modules/disko/btrfs_persist.nix

	    # Server
	    #../../modules/srv/locate.nix
    	../../modules/srv/boot.nix
        ../../modules/srv/pkgs.nix
        ../../modules/srv/settings.nix
        ../../modules/srv/user.nix
        
        # Monitoring
        ../../modules/srv/monitoring/elk.nix
        ../../modules/srv/monitoring/endlessh.nix

        # Network
	    ../../modules/srv/net.nix
        ../../modules/srv/vpn/mullvad.nix
        ../../modules/srv/vpn/tailscale.nix
        
        # systemd services + timers
        #../../modules/srv/systemd/automount_hdd.nix
        #../../modules/srv/systemd/backup_and_compress.nix
        ../../modules/srv/systemd/qbittorrent.nix

        ###### MORE SERVICES ######
        ../../modules/sec/clamav.nix
        ../../modules/vm/libvirt.nix
        #../../modules/srv/xmr.nix
    ];
}
