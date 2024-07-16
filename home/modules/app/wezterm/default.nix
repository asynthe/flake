{ config, lib, ... }: {
    programs.wezterm = {
        enable = true;
        enableBashIntegration = config.programs.bash.enable;
        enableZshIntegration = config.programs.zsh.enable;
	    extraConfig = builtins.readFile ./config.lua;
    };
    home.sessionVariables = lib.mkForce { TERM = "wezterm"; };
    programs.zsh.shellAliases = lib.mkIf config.programs.zsh.enable {
        img = "wezterm imgcat";
    };
}
