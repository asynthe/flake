{ pkgs, pkgs-stable, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs-stable)
	        # ...
	    ;
        inherit (pkgs)

            # Get all the wayland / X11 specific ?
            # Move general audio?

            # MOVE THESE TOOLS ?
            ollama

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
            #kdenlive
            #davinci-resolve # Not working.

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
            sox

            # Reverse Engineering
            nasm nasmfmt
            yasm

            # Reverse engineering / Disassemblers
            #ghidra-bin #ghidra
            #radare2
            #hopper

            # Archiving
	        #mdf2iso
            p7zip
            rar #unrar #rar2fs
            #torrent7z
            unar # Allows for unzipping with Unicode characters.
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
