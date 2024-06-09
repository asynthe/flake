{ pkgs, pkgs-stable, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs-stable)
	        # ...
	    ;
        inherit (pkgs)

	        # Terminal
	        kitty
            cool-retro-term
            powershell

            # GUI
	        brave
	        emacs29-pgtk
	        #gimp
	        hypnotix
	        keepassxc
	        #libreoffice
	        #obsidian
	        #etcher
	        gparted
	        ventoy-full #ventoy
            wf-recorder

            # CLI
	        htop btop
	        hyperfine
	        imagemagickBig #imagemagick
	        img2pdf
	        libqalculate
            cpu-x
            ffmpeg
            mediainfo # Video/audio metadata
            tectonic # LaTeX Engine

            # Compress / Extract
	        #mdf2iso
	        p7zip
	        rar #unrar #rar2fs
	        #torrent7z
	        unar # Unzipping with Unicode characters.
	        #xz
	        zip unzip 

            # Bluetooth
            bluetuith
            bluez
            bluez-tools

	        # Japanese
	        #anki-bin
	        memento

	        # Astronomy
	        #celestia
	        #libnova
	        stellarium
            starfetch

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
