{ config, pkgs, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)

	    wallust # pywal, but mantained.
	    imv # Image Viewer.
            wofi # App launcher.
	    wl-clipboard # Clipboard.
            swww # Wallpaper.
            mpvpaper # Video wallpaper.
            waybar #eww-wayland # Bar.
            swayidle # Idle daemon.
            grim slurp # Screenshot.
            ripdrag # Drag & Drop.
            mako libnotify # Notification daemon.
            wdisplays #wlr-randr #kanshi
            brightnessctl #brillo
            #gtklock #swaylock-effects
            #wlogout
	;
        inherit (pkgs.libsForQt5) polkit-kde-agent; # Authentication Agent
        inherit (pkgs.libsForQt5.qt5) qtwayland;
        #inherit (pkgs.qt6) qtwayland; # Qt Wayland Support
        #inherit (pkgs.xorg) xlsclients; # Check for apps running on xwayland
        #inherit (pkgs.xfce) xfce4-terminal mousepad;
    };
}
