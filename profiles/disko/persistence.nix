{
    # This copies files to /persist, then from /persist to where specified.
    environment.persistence."/persist" = {
        directories = [
	        "/etc/NetworkManager/system-connections"
	        "/etc/nixos"
	        "/var/lib/bluetooth"
	        "/var/lib/nixos"
	        "/var/lib/systemd/coredump"
	        "/var/lib/tailscale"

            "/etc/secureboot" # If lanzaboote OPTION is ENABLED
	    ];
        files = [
	        "/etc/machine-id"
	    ];
    };

    fileSystems = {
        "/persist".neededForBoot = true;
        "/var/log".neededForBoot = true;
    };
}
