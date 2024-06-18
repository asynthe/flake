{
    wayland.windowManager.hyprland.settings = {
        workspace = "special, border: 0";
        layerrule = [
            "noanim, wofi"
            "noanim, wshowkeys"
        ];
        windowrulev2 = [
            "noanim, floating: 1"

            # Chromium
            "center, class:%(chromium), title:^(Save File)$"
            "float, class:%(chromium), title:^(Save File)$"
            "noborder, class:%(chromium), title:^(Save File)$"

            # Firefox (Librewolf), Picture-in-Picture
            "opacity 1.0 1.0 1.0 , class:^(librewolf)$"
            "center, title:^(Enter name of file to save to...)$"
            "center, title:^(Picture-in-Picture)$" # ADD move to right bottom corner
            "float, title:^(Picture-in-Picture)$"
            "noanim, title:^(Picture-in-Picture)$"
            "noanim, title:^(Enter name of file to save to...)$"
            "noborder, title:^(Enter name of file to save to...)$"
            "noborder, title:^(Picture-in-Picture)$"
            "opacity 1.0, title:^(Picture-in-Picture)$"
            "pin, title:^(Picture-in-Picture)$"

            # Hypnotix
            "float, class:^(Hypnotix.py)$"
            "idleinhibit always, class:^(Hypnotix.py)$"
            "pin, class:^(Hypnotix.py)$"
            #"size 723 408, class:^(Hypnotix.py)$
            #"move 43% 45%, class:^(Hypnotix.py)$  
            #"move 44% 45%, class:^(Hypnotix.py)$  
            #"move 849 489, class:^(Hypnotix.py)$
            #"move 55% 49%, class:^(Hypnotix.py)$

            # KeepassXC
            "float, class:^(org.keepassxc.KeePassXC)$"
            "noanim, class:^(org.keepassxc.KeePassXC)$"

            # mpv
            "idleinhibit focus, class:^(mpv)$"
            "idleinhibit fullscreen, class:^(mpv)$"

            # Mullvad
            "animation popin, title:(Mullvad VPN)"
            "float, title:(Mullvad VPN)"
            #"move 3520 512, title:(Mullvad VPN)"
            #"move -100%, title:(Mullvad VPN)"
            "noborder, title:(Mullvad VPN)"

            # pavucontrol
            "float, class:^(pavucontrol)$"
            "noanim, class:pavucontrol.*$"
            "noborder, class:^(pavucontrol)$"
            "center, class:^(pavucontrol)$"
            "size 800 500, class:^(pavucontrol)$"

            # Qbittorrent
            "workspace 10 silent, class:^(org.qbittorrent.qBittorrent)$"
            "noanim, class:^(org.qbittorrent.qBittorrent)$"

            # Steam
            "idleinhibit always, class:^(steam)$"
            "minsize 1 1, title:^()$,class:^(steam)$"
            "stayfocused, title:^()$,class:^(steam)$"

            # Waydroid
            "float, title:^(Waydroid)$"

	    # Wezterm
	    "float,class:^(org.wezfurlong.wezterm)$"
	    "tile,class:^(org.wezfurlong.wezterm)$"

            # Zathura
            "noanim, class:(org.pwmt.zathura)$"
            "opacity 0.9, class:(org.pwmt.zathura)$"

            # Other
            "float, class:^(org.qgis.)$"
            "fakefullscreen, class:VirtualBoxVM"
            "fakefullscreen, class:org.telegram.desktop"
            #"float, class:^(Anki)$"
            #"move 66% 54%, class:^(Anki)$"
            #"noanim, class:^(Anki)$"
        ];
    };
}
