{ config, lib, pkgs, ... }: {

    programs.direnv = {
        enable = true;
	nix-direnv.enable = true;
        enableBashIntegration = config.programs.bash.enable;
	enableFishIntegration = config.programs.fish.enable;
	enableNushellIntegration = config.programs.nushell.enable;
	enableZshIntegration = config.programs.zsh.enable;
	#config = {
	#};
    };

    programs.zsh = lib.mkIf config.programs.direnv.enableZshIntegration {
        initExtra =  
          ''eval "$(direnv hook zsh)"'';
	sessionVariables = {
	  DIRENV_WARN_TIMEOUT = 0;
	};
    };

}
