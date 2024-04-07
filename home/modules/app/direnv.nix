{ config, lib, ... }: {

    programs.direnv = {
        enable = true;
	nix-direnv.enable = true;
        enableBashIntegration = config.programs.bash.enable;
	enableFishIntegration = config.programs.fish.enable;
	enableNushellIntegration = config.programs.nushell.enable;
	enableZshIntegration = config.programs.zsh.enable;
	config = {
	    global = {
	        warn_timeout = "2h";
		hide_env_diff = true;
	    };
	};
    };

    programs.zsh = lib.mkIf config.programs.direnv.enableZshIntegration {
        initExtra =  
          ''eval "$(direnv hook zsh)"'';
    };
}
