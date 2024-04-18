{ config, inputs, pkgs, user, ... }: {

    wsl = {
        enable = true;
	defaultUser = "nixos";
    };

    environment.systemPackages = builtins.attrValues {
        inherit (pkgs)
	    home-manager
	;
    };
}
