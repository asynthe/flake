{
    wayland.windowManager.hyprland.settings = {
        layerrule = [
            "noanim, wofi"
            "noanim, wshowkeys"
        ];
        windowrulev2 = [
            "noanim, floating: 1"

            # Chromium
            "center, class:(chromium), title:(Save File)"
            "float, class:(chromium), title:(Save File)"
            "noborder, class:(chromium), title:(Save File)"
            "opacity 1.0 override 1.0 override, class:(Save File)"
            "opacity 1.0 override 1.0 override, class:(chromium)"

            # Firefox (Librewolf), Picture-in-Picture
            "opacity 1.0 override 1.0 override, class:^(librewolf)$"
            "idleinhibit focus, class:^(librewolf)$, title:^(.*YouTube.*)$"
            "idleinhibit fullscreen, class:^(librewolf)$"
            "opacity 1.0 override 1.0 override, title:^(Enter name of file to save to...)$"
            "center, title:^(Enter name of file to save to...)$"
            "noanim, title:^(Enter name of file to save to...)$"
            "noborder, title:^(Enter name of file to save to...)$"
            # Firefox - Picture-in-Picture - ピクチャーインピクチャー
            "center, title:^(Picture-in-Picture)$" # ADD move to right bottom corner
            "float, title:^(Picture-in-Picture)$"
            "noanim, title:^(Picture-in-Picture)$"
            "noborder, title:^(Picture-in-Picture)$"
            "nodim, title:^(Picture-in-Picture)$"
            "nodim, title:^(ピクチャーインピクチャー)$"
            "opacity 1.0 override 1.0 override, title:^(Picture-in-Picture)$"
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
            "opacity 1.0 override 1.0 override, class:^(mpv)$"
            "idleinhibit focus, class:^(mpv)$"
            "idleinhibit fullscreen, class:^(mpv)$"

            # Mullvad
            "float, title:(Mullvad VPN)"
            "noanim, title:(Mullvad VPN)"
            "noborder, title:(Mullvad VPN)"
            "opacity 1.0 override 1.0 override, title:(Mullvad VPN)"
            "workspace 10 silent, title:(Mullvad VPN)"
            #"move 3520 512, title:(Mullvad VPN)"
            #"move -100%, title:(Mullvad VPN)"

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
	        "float, class:^(org.wezfurlong.wezterm)$"
	        "tile, class:^(org.wezfurlong.wezterm)$"

            # Zathura
            #"noanim, class:(org.pwmt.zathura)$"
            "opacity 1.0 override 1.0 override, class:(org.pwmt.zathura)$"

            # Vmware
            #"fakefullscreen, class:^(Vmware)$"
            "float, class:^(Vmware)$"
            "opacity 1.0 override 1.0 override, class:^(Vmware)$"
            #"center, title:^(Open Virtual Machines)$,class:^(Vmware)$"
            #"float, title:^(Open Virtual Machines)$,class:^(Vmware)$"

            # Other
            "center, class:^(org.kde.polkit-kde-authentication-agent-1)$"
            #"fakefullscreen, class:VirtualBoxVM"
            #"fakefullscreen, class:org.telegram.desktop"
            "float, class:^(org.kde.polkit-kde-authentication-agent-1)$"
            "float, class:^(org.qgis.)$"
            "float, title:^(Media viewer)$" # Telegram media viewer
            #"float, class:^(Anki)$"
            #"move 66% 54%, class:^(Anki)$"
            #"noanim, class:^(Anki)$"

            # Sharing Indicators
            "workspace special silent, title:^(Firefox — Sharing Indicator)$"
            "workspace special silent, title:^(.*is sharing (your screen|a window)\.)$"
        ];
    };
}
