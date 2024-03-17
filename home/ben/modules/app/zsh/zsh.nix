{ config, pkgs, ... }: {

    programs.zsh = {
        enable = true;
	defaultKeymap = "vicmd"; # `emacs`, `vicmd`, `viins`.
	dotDir = ".config/zsh";

	# Configuration
	autocd = true;
	history.size = 10000;

	# Plugins
	autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
	# Or
	#plugins.<> = {
	    #name = ;
	    #file = ;
	    #src = ;
	#};

	# Variables
	sessionVariables = {
	    MAILCHECK = 30;
	};

        # Aliases
        #shellGlobalAliases = {
            #UUID = "...";
        #};
        #shellAliases = {
            #UUID = "...";
        #};
    };

    programs = {
        broot.enableZshIntegration = true;
        direnv.enableZshIntegration = true;
        eza.enableZshIntegration = true;
        fzf.enableZshIntegration = true;
	skim.enableZshIntegration = true;
	starship.enableZshIntegration = true;
        #pyenv.enableZshIntegration = true;
	zoxide.enableZshIntegration = true;
    };
}
