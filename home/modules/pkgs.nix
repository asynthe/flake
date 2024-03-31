{ config, pkgs, ... }: {


    home.packages = builtins.attrValues {
        inherit (pkgs)

	    # Net
	    bucklespring-libinput # Requires user in `input` group.
	    netcat-openbsd
	    socat

	    # Temporary
	    brave # Brave browser
	    gimp
	    barrier # Open-source KVM software.
	    pinta

            # Shell
            ueberzugpp
            fd ripgrep
            fzf skim

            # Tools - GUI
	    emacs29-pgtk
            zathura
	    #obsidian
	    hypnotix # TV

            # Tools - CLI
	    libqalculate
            ncdu

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
            unimatrix
            pipes-rs
            cava cli-visualizer

	    # Japanese
	    memento
	    #anki-bin

	    # Wayland
	    wallust # pywal, but mantained.
	    imv # Image Viewer.
            wofi # App launcher.
	    wl-clipboard # Clipboard.
            swww # Wallpaper.
            mpvpaper # Video wallpaper.
            #waybar #eww-wayland # Bar.
            swayidle # Idle daemon.
            grim slurp # Screenshot.
            ripdrag # Drag & Drop.
            mako libnotify # Notification daemon.
            wdisplays #wlr-randr #kanshi
            brightnessctl #brillo
            #gtklock
	    #swaylock-effects
            #wlogout
	;
        inherit (pkgs.libsForQt5) polkit-kde-agent; # Authentication Agent
        inherit (pkgs.libsForQt5.qt5) qtwayland;
        #inherit (pkgs.qt6) qtwayland; # Qt Wayland Support
        #inherit (pkgs.xorg) xlsclients; # Check for apps running on xwayland
        #inherit (pkgs.xfce) xfce4-terminal mousepad;
    };
}
