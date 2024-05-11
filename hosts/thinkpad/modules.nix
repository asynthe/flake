{
    imports = [

        ../../secrets/secrets.nix
	    #../../secrets/secrets_custom.nix

        # Boot
        ../../modules/boot/banner.nix
        ../../modules/boot/boot.nix # systemd-boot
        #../../modules/boot/console.nix
        #../../modules/boot/greetd.nix # for Hyprland
        #../../modules/boot/kmscon.nix 
        #../../modules/boot/silent.nix

        # Custom
        ../../modules/custom/locale.nix

	    # Daemon
	    ../../modules/daemon/android.nix
	    ../../modules/daemon/docker.nix
	    ../../modules/daemon/gpg.nix
	    #../../modules/daemon/httpd.nix
	    ../../modules/daemon/locate.nix
	    #../../modules/daemon/sql.nix

	    # Driver
	    ../../modules/driver/acpi.nix
	    ../../modules/driver/printer.nix
        #../../modules/disko/btrfs_persist.nix

        ../../modules/audio.nix
        ../../modules/bluetooth.nix
        ../../modules/hyprland.nix
        ../../modules/net.nix
        ../../modules/pkgs.nix
        ../../modules/settings.nix
        ../../modules/sys.nix
        ../../modules/user.nix
        ../../modules/vpn.nix
        
        ../../modules/game/steam.nix
        ../../modules/sys/fstrim.nix
        ../../modules/vm/libvirt.nix
        
        ../../modules/net/ssh/mosh.nix
        ../../modules/net/ssh/ssh.nix
        ../../modules/net/ssh/sshfs.nix
        
        ../../modules/net/vpn/mullvad.nix
        ../../modules/sysd/lid_switch.nix # Lid switch action for laptops.
        
        # Security
        ../../modules/sec/clamav.nix
    ];
}
