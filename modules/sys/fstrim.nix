{ config, ... }: {

    services.fstrim = {
        enable = true;
	#interval = ""; # default "weekly".
    };
}
