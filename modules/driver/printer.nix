{ config, pkgs, username, ... }: {

    environment.systemPackages = builtins.attrValues {
        inherit (pkgs)
	    xsane
	;
    };

    users.users.${username}.extraGroups = [ "cups" "scanner" "lp" ];
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
        nssmdns = true;
        openFirewall = true;
    };
}
