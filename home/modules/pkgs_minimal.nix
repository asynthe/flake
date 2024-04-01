{ config, pkgs, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)

	    nix # lol # ?
            neovim
            git

	    # GUI
            emacs29-pgtk
	    zathura
	    mpv

	    # Test
	    alacritty kitty
	    gopass
	    pass-wayland

	    # Compress
	    zip unzip unar
        ;
    };
}