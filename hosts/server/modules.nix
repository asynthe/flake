{
    imports = [

        # Disk configuration
	    ../../modules/disko/btrfs_persist.nix

	    # Server
	    #../../modules/srv/locate.nix
    	../../modules/srv/boot.nix
        ../../modules/srv/settings.nix
        ../../modules/pkgs/pkgs_server.nix
        ../../modules/sec/clamav.nix
        ../../modules/vm/libvirt.nix

        # Network
	    ../../modules/net/net.nix
        
        # systemd services + timers
        #../../modules/srv/systemd/automount_hdd.nix
        #../../modules/srv/systemd/backup_and_compress.nix
    ];
}
