{ config, pkgs, ... }: {

    hardware.bluetooth.enable = true;
    environment.systemPackages = builtins.attrValues {
        inherit (pkgs)
            bluez
	    bluez-tools
	    bluetuith # Bluetooth ncurses frontend.
	;
    };
}
