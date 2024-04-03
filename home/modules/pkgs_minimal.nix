{ config, pkgs, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)

	    nix # lol # ?
            neovim
            git

	    # Test
	    alacritty kitty
	    gopass
	    pass-wayland

	    # GUI
            emacs29-pgtk
	    zathura

	    # CLI
	    imagemagick
	    htop btop
	    libqalculate
	    bc

	    # Compress
	    zip unzip unar

	    # Fun
	    cava
	    cli-visualizer
	    pulseaudioFull
        ;
    };
}
