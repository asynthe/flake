{ config, pkgs, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)

	    nix # lol
	    lf
            tmux
            neovim
            git

	    # GUI
            emacs29-pgtk
	    zathura

	    # Test
	    gopass
	    pass-wayland
        ;
    };
}
