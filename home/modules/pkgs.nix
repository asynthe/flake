{ config, pkgs, pkgs-stable, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs-stable)

	    # ...

	;
        inherit (pkgs)

	    # Networking Tools
	    ciscoPacketTracer8
	    gns3-gui gns3-server

	    # Temporary
	    bucklespring-libinput # Requires user in `input` group.
	    barrier # Open-source KVM software.
	    tor-browser
	    brave
	    php

            # Tools - GUI
	    emacs29-pgtk
	    gimp pinta
	    hypnotix
	    keepassxc
	    libreoffice
	    obsidian

            # CLI
            fd ripgrep
            fzf skim

            # Tools - CLI
	    hyperfine
	    imagemagickBig #imagemagick
	    libqalculate
            ncdu
	    img2pdf

	    # Tools - Presenting
	    slides
	    #zoom-us
	    #slack #slack-cli #slack-term # ?

            # Tools - Compressing
	    #mdf2iso
	    #rar #unrar #rar2fs
	    #torrent7z
	    #xz
	    p7zip
            unar # Unzipping with Unicode characters.
            zip unzip

	    # Tools - Partitioning / Formatting
	    #etcher
	    gparted
	    ventoy-full #ventoy

            # Bluetooth
            bluetuith
            bluez
            bluez-tools

            # Fun
	    figlet
	    lolcat
	    nhentai # ( ͡° ͜ʖ ͡°) 
	    unimatrix
            cava cli-visualizer
            pipes-rs

	    # Japanese
	    #anki-bin
	    memento

	    # Astronomy
	    #celestia
	    #libnova
	    stellarium
	;
    };
}
