{ config, pkgs, pkgs-unstable, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs-unstable)
	    ciscoPacketTracer8
	    unimatrix
	;
        inherit (pkgs)

	    # Networking Tools
	    gns3-gui gns3-server

	    # Temporary
	    bucklespring-libinput # Requires user in `input` group.
	    barrier # Open-source KVM software.
	    pinta
	    tor-browser

            # Shell
            fd ripgrep
            fzf skim

            # Tools - GUI
	    emacs29-pgtk
	    hypnotix
	    keepassxc
	    libreoffice

            # Tools - CLI
	    imagemagick
	    libqalculate
            ncdu

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
            #unimatrix
            cava cli-visualizer
            pipes-rs
	    figlet
	    lolcat

	    # Japanese
	    #anki-bin
	    memento

	    # Astronomy
	    stellarium
	;
    };
}
