{ config, pkgs, user, ... }: {

    environment.systemPackages = builtins.attrValues {
        inherit (pkgs)
	    xsane
	;
    };

    users.users.${user}.extraGroups = [ "cups" "scanner" "lp" ];
    services.printing = { # Printing
        enable = true;
        drivers = [ pkgs.hplipWithPlugin ];
    };
    hardware.sane = { # Scanning
        enable = true;
	extraBackends = [ 
	    pkgs.hplipWithPlugin
	    pkgs.sane-airscan
	];
	#disabledDefaultBackends = [ "escl" ];
    };
    services.ipp-usb.enable = true;

    # Autodiscovery of network printers
    services.avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
    };
}
