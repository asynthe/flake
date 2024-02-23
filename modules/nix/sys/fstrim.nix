{ config, pkgs, ... }: {

    services.fstrim = {
        enable = true;
	#interval = ""; # default "weekly".
    };
}
