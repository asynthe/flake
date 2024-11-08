{ config, inputs, lib, pkgs, pkgs-stable, ... }: {

    programs.wezterm = {
        enable = true;
        package = inputs.wezterm.packages.${pkgs.system}.default;
        enableBashIntegration = config.programs.bash.enable;
        enableZshIntegration = config.programs.zsh.enable;
        #extraConfig = builtins.readFile ../../../../dots/wezterm/config.lua;

        # Disabled as stylix writes into the file.
	    #extraConfig = config.lib.file.mkOutOfStoreSymlink ./config.lua;
    };

    programs.zsh.shellAliases = lib.mkIf config.programs.zsh.enable {
        img = "wezterm imgcat";
    };

    home = {
        sessionVariables = { TERM = "wezterm"; };
        packages = builtins.attrValues {
            inherit (pkgs)
                alsa-utils
            ;
        };
    };
}
