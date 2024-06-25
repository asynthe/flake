{ config, pkgs, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)
	    wayfire
	;
    };

    programs.zsh.sessionVariables = {
        WAYFIRE_CONFIG_FILE = "${config.xdg.configHome}/wayfire/wayfire.ini";
    };
}
