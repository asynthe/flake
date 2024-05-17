{
    wayland.windowManager.hyprland.settings = {
        workspace = "special,border: 0";
        layerrule = [
            "noanim, wofi"
            "noanim, wshowkeys"
        ];
        windowrulev2 = [
            "noanim, floating: 1"

            # firefox
            # hypnotix
            # keepassxc
            # mpv
            # mullvad-vpn
            # pavucontrol
            # qbittorrent
            # steam
            # waydroid
            # zathura

            # Firefox, Picture-in-Picture
            "float, title:^(Picture-in-Picture)$"
            "noanim, title:^(Picture-in-Picture)$"
            "noborder, title:^(Enter name of file to save to...)$"
            "noborder, title:^(Picture-in-Picture)$"
            "pin, title:^(Picture-in-Picture)$"

            # Hypnotix
            "float,class:^(Hypnotix.py)$"
            "idleinhibit always,class:^(Hypnotix.py)$"
            "pin, class:^(Hypnotix.py)$"
            #"size 723 408,class:^(Hypnotix.py)$
            #"move 43% 45%,class:^(Hypnotix.py)$  
            #"move 44% 45%,class:^(Hypnotix.py)$  
            #"move 849 489,class:^(Hypnotix.py)$
            #"move 55% 49%,class:^(Hypnotix.py)$

            # KeepassXC
            "float,class:^(org.keepassxc.KeePassXC)$"
            "noanim,class:^(org.keepassxc.KeePassXC)$"

            # mpv
            "idleinhibit fullscreen, class:^(mpv)$"
            "idleinhibit focus, class:^(mpv)$"

            # pavucontrol
            "float,class:^(pavucontrol)$"
            "noanim,class:pavucontrol.*$"
            "noborder,class:^(pavucontrol)$"
            "size 800 500,class:^(pavucontrol)$"

            # Qbittorrent
            "workspace 10 silent, class:^(org.qbittorrent.qBittorrent)$"
            "noanim, class:^(org.qbittorrent.qBittorrent)$"

            # Steam
            "idleinhibit always, class:^(steam)$"
            "minsize 1 1, title:^()$,class:^(steam)$"
            "stayfocused, title:^()$,class:^(steam)$"

            # Waydroid
            "float, title:^(Waydroid)$"

            # Zathura
            "noanim, class:(org.pwmt.zathura)$"
            "opacity 0.9, class:(org.pwmt.zathura)$"

            # Other
            "noborder,class:^(Mullvad VPN)$"
            "float,class:^(org.qgis.)$"
            "fakefullscreen,class:VirtualBoxVM"
            "fakefullscreen,class:org.telegram.desktop"

            # Disabled
            # Anki
            #"float,class:^(Anki)$"
            #"move 66% 54%,class:^(Anki)$"
            #"noanim,class:^(Anki)$"
        ];
    };
}
