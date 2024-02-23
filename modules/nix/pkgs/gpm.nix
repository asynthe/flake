{ config, pkgs, ... }: {

    services.gpm = {
        enable = true;
	protocol = "ps/2";
    };
}
