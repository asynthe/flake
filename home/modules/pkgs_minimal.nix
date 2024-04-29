{ config, pkgs, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)

	    # CLI
	    ascii
	    bc
	    fd ripgrep
	    fzf skim
	    git
	    htop btop
	    hyperfine
	    imagemagickBig #imagemagick
	    img2pdf
	    libqalculate
	    ncdu
	    vim

            # Tools - Compressing
	    #mdf2iso
	    p7zip
	    #rar #unrar #rar2fs
	    #torrent7z
	    unar # Unzipping with Unicode characters.
	    #xz
	    zip unzip 

	    # Fun
	    cava
	    cli-visualizer
	    figlet
	    lolcat
	    nhentai # ( ͡° ͜ʖ ͡°) 
	    peaclock tty-clock
	    pulsemixer #pulseaudioFull
	    unimatrix
            pipes-rs
        ;
    };
}
