{ config, pkgs, lib, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)
	        wayfire
	    ;
    };

    programs.zsh.sessionVariables = {
        WAYFIRE_CONFIG_FILE = "${config.xdg.configHome}/wayfire/wayfire.ini";
    };

    home.file.".config/wayfire/wayfire.ini".source = config.lib.file.mkOutOfStoreSymlink ../../../dots/wayfire/wayfire.ini;
}
