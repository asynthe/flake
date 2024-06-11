{
    imports = [
        ../../profiles # Import all the custom options.
        ./hardware.nix # Import hardware scan.

        ../../secrets/secrets.nix
	    #../../secrets/secrets_custom.nix

        # Boot
        #../../modules/boot/console.nix
        #../../modules/boot/greetd.nix # for Hyprland
        #../../modules/boot/kmscon.nix 
        #../../modules/boot/silent.nix

	    # Daemon
	    ../../modules/daemon/android.nix
	    ../../modules/daemon/docker.nix
	    ../../modules/daemon/gpg.nix
	    #../../modules/daemon/httpd.nix
	    #../../modules/daemon/sql.nix

	    # Driver
	    ../../modules/driver/acpi.nix
	    ../../modules/driver/printer.nix
        #../../modules/disko/btrfs_persist.nix

        ../../modules/sys.nix
        ../../modules/pkgs/pkgs.nix
        # Security

        ../../modules/sec/clamav.nix
        ../../modules/bluetooth.nix # system.bluetooth.enable = true;
        ../../modules/game/steam.nix # games.steam.enable = true;
        ../../modules/sys/fstrim.nix # mkIf system.disk.ssd = true; then .
        ../../modules/vm/libvirt.nix # system.virtualization = [ "libvirt" ];
        #../../modules/vm/virtualbox.nix # system.virtualization = [ "virtualbox" ];
        #../../modules/vm/vmware.nix # system.virtualization = [ "vmware" ];
        ../../modules/sysd/lid_switch.nix # Lid switch action for laptops. / system.laptop.lid_switch = true;
    ];
}
