{
    imports = [
        ./disk.nix
        ./system.nix
        ./hardware.nix # Import hardware scan.
        ../../profiles # Import all the custom options.

        # FIX!!!
        ../../profiles/vm/libvirt.nix
        #../../profiles/vm/vmware.nix
        ../../profiles/vpn/mullvad.nix

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
        ../../modules/sys.nix
        ../../modules/sysd/lid_switch.nix # Lid switch action for laptops. / system.laptop.lid_switch = true;
    ];
}
