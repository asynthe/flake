{ config, pkgs, lib, ... }: {

    home = {
        file.".config/wayfire/wayfire.ini".source = config.lib.file.mkOutOfStoreSymlink ./wayfire.ini;
        packages = builtins.attrValues {
            inherit (pkgs)
	            wayfire
	        ;
        };
    };

    programs = {
        zsh.sessionVariables = lib.mkIf config.programs.zsh.enable {
            WAYFIRE_CONFIG_FILE = "${config.xdg.configHome}/wayfire/wayfire.ini";
        };
        bash.sessionVariables = lib.mkIf config.programs.bash.enable {
            WAYFIRE_CONFIG_FILE = "${config.xdg.configHome}/wayfire/wayfire.ini";
        };
    };
}
