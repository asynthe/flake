{ pkgs, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)
	        # CLI
	        ascii
	        bc
	        fd ripgrep
	        fzf skim
	        git
	        ncdu
            #neovim # Make an option, make remove if the home-manager neovim is enabled bc collision.
        ;
    };
}
