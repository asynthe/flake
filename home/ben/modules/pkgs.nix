{ config, pkgs, ... }: {

    

    home.packages = builtins.attrValues {
        inherit (pkgs)

	    # Temporary
	    brave # Brave browser
	    firefox
	    gimp
	    barrier # Open-source KVM software.

            # Shell
            direnv
            eza
            starship
            ueberzugpp
            fd ripgrep
            fzf skim
            zoxide
	    wl-clipboard

            # Tools
	    yt-dlp
	    libqalculate
            ncdu

	    # Tools - Presenting
	    slides
	    #zoom-us
	    #slack #slack-cli #slack-term # ?

            # Tools - GUI
            mpv
            zathura
	    obs-studio
	    #obsidian
	    hypnotix # TV

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
            unimatrix
            pipes-rs
            cava cli-visualizer
        ;
    };
}
