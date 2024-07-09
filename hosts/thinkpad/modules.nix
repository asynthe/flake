{
    imports = [

        # CLEAN
        ../../profiles # Import all the custom options.
        ./hardware.nix # Import hardware scan.

        ../../secrets/secrets.nix
	    #../../secrets/secrets_custom.nix


	    # Driver
	    ../../modules/driver/acpi.nix
	    #../../modules/driver/printer.nix
        #../../modules/disko/btrfs_persist.nix

        # Services
	    #../../modules/services/avahi.nix
	    #../../modules/services/clamav.nix
	    #../../modules/services/httpd.nix
        #../../modules/services/mirakurun.nix # Need DVR.
	    #../../modules/services/monica.nix
	    ../../modules/services/polkit.nix

        ../../modules/sys.nix
        ../../modules/sysd/lid_switch.nix # Lid switch action for laptops. / system.laptop.lid_switch = true;

        #../../modules/vm/libvirt.nix # system.virtualization = [ "libvirt" ];
        #../../modules/vm/virtualbox.nix # system.virtualization = [ "virtualbox" ];
        #../../modules/vm/vmware.nix # system.virtualization = [ "vmware" ];
    ];
}
