{ config, pkgs, ... }: {

    # TEST

    home.packages = builtins.attrValues {
        inherit (pkgs)
	    scrcpy
	    waydroid
	;
    };
}
