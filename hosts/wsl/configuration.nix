{ config, inputs, pkgs, user, ... }: {

    wsl = {
        enable = true;
	defaultUser = "${user}";
    };

    environment.systemPackages = builtins.attrValues {
        inherit (pkgs)
	    home-manager
	;
    };
}
