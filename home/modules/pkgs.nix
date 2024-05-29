{ pkgs, pkgs-stable, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs-stable)
	        # ...
	    ;
        inherit (pkgs)

	        # Temp
	        ciscoPacketTracer8
	        gns3-gui gns3-server
	        slides
	        #zoom-us
	        #slack #slack-cli #slack-term # ?

	        # Terminal
	        alacritty kitty
            cool-retro-term

            # GUI
	        brave
	        emacs29-pgtk
	        #gimp
	        hypnotix
	        keepassxc
	        #libreoffice
	        #obsidian
            qbittorrent
	        #etcher
	        gparted
	        ventoy-full #ventoy

            # CLI
            cpu-x
            tectonic # LaTeX Engine
	        htop btop
	        hyperfine
	        imagemagickBig #imagemagick
	        img2pdf
	        libqalculate

            # Compress / Extract
	        #mdf2iso
	        p7zip
	        #rar #unrar #rar2fs
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
