{ pkgs, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)

	        # Terminal
	        kitty
            cool-retro-term

	        # Japanese
	        #anki-bin
	        memento

            # Social
            signal-desktop
            telegram-desktop
            weechat hexchat # IRC
            webcord #discord # fuck discord

            # GUI
            #aegisub # Subtitle Editor
	        emacs29-pgtk
	        #etcher
	        #gimp-with-plugins #gimp # Remember to configure photogimp.
	        gparted
	        hypnotix
	        keepassxc
	        #libreoffice
	        #obsidian
	        ungoogled-chromium #brave
	        ventoy-full #ventoy
            #aegisub
            #davinci-resolve # Not working.
            #kdenlive
            #nicotine-plus
            qmmp
            #wf-recorder

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
            pfetch neofetch
            pipes-rs
            pv

            # File Manager - Thumbnailers for PCmanFM
            pcmanfm
            nufraw-thumbnailer # .raw files (raw-thumbnailer)
            evince # Adobe .pdf files
            ffmpegthumbnailer # Video files
            freetype # Font files
            libgsf # .odf files

	    ;
        # File managers
        inherit (pkgs.libsForQt5) dolphin; 
        inherit (pkgs.xfce) thunar tumbler;
    };
}
