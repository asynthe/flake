{
    imports = [

    	# We are going to have to move stuff
	    # from pkgs to pkgs minimal
	    # or to another tools, idk
	    # We need more cli shit.
        ../modules/pkgs/minimal.nix
        ../modules/pkgs/cli.nix
        #../modules/pkgs/gui.nix

        # GUI
        ../modules/app/emacs

	    # Imports
	    ../modules/app/nvim
	    ../modules/app/lf
	    ../modules/app/gpg

	    # Imports - Single Files
	    #../modules/app/bash.nix
	    ../modules/app/bat.nix
	    ../modules/app/direnv.nix
	    ../modules/app/eza.nix
	    ../modules/app/git.nix
	    ../modules/app/starship.nix
	    ../modules/app/tmux.nix
        ../modules/app/zoxide.nix
        ../modules/app/zsh.nix
        
        # System
        ../modules/sys/fonts.nix
        ../modules/sys/settings.nix
        ../modules/sys/stylix.nix
        #../modules/sys/uutils-replace.nix
        ../modules/sys/var.nix
        #../modules/sys/xdg.nix
    ];
}
