{
    imports = [

        # Disk configuration
	    ../../modules/disko/btrfs_persist.nix

	    # Server
	    #../../modules/srv/locate.nix
    	../../modules/srv/boot.nix
        ../../modules/srv/pkgs.nix
        ../../modules/srv/settings.nix

        # Network
	    ../../modules/srv/net/net.nix
        
        # systemd services + timers
        #../../modules/srv/systemd/automount_hdd.nix
        #../../modules/srv/systemd/backup_and_compress.nix

        ###### MORE SERVICES ######
        ../../modules/sec/clamav.nix
        ../../modules/vm/libvirt.nix
    ];
}
