{ pkgs, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)
	    
	    mangohud
	    lutris
	    #gamemode # Enabled through a NixOS option.
	;
    };
}
