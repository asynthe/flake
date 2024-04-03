{ config, pkgs, ... }: {


    home.packages = builtins.attrValues {
        inherit (pkgs)

	    # Temporary
	    bucklespring-libinput # Requires user in `input` group.
	    brave # Brave browser
	    gimp
	    barrier # Open-source KVM software.
	    pinta
	    # Net
	    netcat-openbsd
	    socat

            # Shell
            fd ripgrep
            fzf skim

            # Tools - GUI
	    emacs29-pgtk
	    #obsidian
	    hypnotix # TV
	    keepassxc

            # Tools - CLI
	    imagemagick
	    libqalculate
            ncdu

	    curl
	    jq

	    # Tools - Presenting
	    slides
	    #zoom-us
	    #slack #slack-cli #slack-term # ?

            # Tools - Compressing
            zip unzip
            unar # Unzipping with Unicode characters.
	    p7zip
	    #xz
	    #rar #unrar #rar2fs
	    #torrent7z
	    #mdf2iso

	    # Tools - Partitioning / Formatting
	    gparted
	    ventoy-full #ventoy
	    #etcher

            # Bluetooth
            bluez
            bluez-tools
            bluetuith

            # Fun
            #unimatrix
            pipes-rs
            cava cli-visualizer

	    # Japanese
	    memento
	    #anki-bin

	    # Astronomy
	    stellarium
	;
    };
}
