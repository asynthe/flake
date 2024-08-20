{ pkgs, ... }: let

    modkey = "ALT";
    modkey2 = "SUPER";
    monitor1 = "eDP-1";

in {
    wayland.windowManager.hyprland.settings = {
        "$mainMod" = "${modkey}";

        input = {
            follow_mouse = 1;
            kb_layout = "us";
            kb_options = "caps:swapescape";
            sensitivity = 0;
            touchpad.natural_scroll = false;
        };

        bind = [
            # Apps
            #"$mainMod SHIFT, return, exec, [float;tile] ${pkgs.wezterm}/bin/wezterm start --always-new-process"
            "$mainMod SHIFT, return, exec, [tile] alacritty"
            "$mainMod, p, exec, pkill ${pkgs.wofi}/bin/wofi || ${pkgs.wofi}/bin/wofi --show drun"
            "$mainMod, v, exec, [float] pkill ${pkgs.pavucontrol}/bin/pavucontrol || ${pkgs.pavucontrol}/bin/pavucontrol"
            #"${modkey2}, b, exec, pkill ${pkgs.waybar}/bin/waybar || ${pkgs.waybar}/bin/waybar"

            # Screenshots
            "${modkey2}, s, exec, ${pkgs.hyprshot}/bin/hyprshot --raw --mode region | ${pkgs.swappy}/bin/swappy --file -"
            "${modkey2} SHIFT, s, exec, ${pkgs.hyprshot}/bin/hyprshot --raw --mode window | ${pkgs.swappy}/bin/swappy --file -"
            "${modkey2} CTRL, s, exec, ${pkgs.hyprshot}/bin/hyprshot --raw --mode output | ${pkgs.swappy}/bin/swappy --file -"

            # Actions
            "$mainMod SHIFT, c, killactive,"
            "$mainMod SHIFT, o, exit,"

            # Actions - Windows
            "$mainMod SHIFT, p, pin,"
            "$mainMod, d, togglesplit," # Dwindle
            "$mainMod, f, fullscreen,"
            "$mainMod, m, togglefloating,"
            #"$mainMod, n, fakefullscreen,"
            "$mainMod, o, pseudo," # Dwindle

            # Windows - Focus
            "$mainMod, h, movefocus, l"
            "$mainMod, j, movefocus, d"
            "$mainMod, k, movefocus, u"
            "$mainMod, l, movefocus, r"

            # Windows - Swap
            "$mainMod SHIFT, h, movewindow, l"
            "$mainMod SHIFT, j, movewindow, d"
            "$mainMod SHIFT, k, movewindow, u"
            "$mainMod SHIFT, l, movewindow, r"

            # Monitor and Workspace focus
            "$mainMod, comma, focusmonitor, -1"
            "$mainMod, period, focusmonitor, +1"
            "$mainMod SHIFT, comma, workspace, e-1"
            "$mainMod SHIFT, period, workspace, e+1"

            # Switch workspaces with mouse scroll
            "$mainMod, mouse_up, workspace, e-1"
            "$mainMod, mouse_down, workspace, e+1"

            # Workspaces
            "$mainMod, 1, workspace, 1"
            "$mainMod, 2, workspace, 2"
            "$mainMod, 3, workspace, 3"
            "$mainMod, 4, workspace, 4"
            "$mainMod, 5, workspace, 5"
            "$mainMod, 6, workspace, 6"
            "$mainMod, 7, workspace, 7"
            "$mainMod, 8, workspace, 8"
            "$mainMod, 9, workspace, 9"
            "$mainMod, 0, workspace, 10"
            "$mainMod, s, togglespecialworkspace" # Scratchpad

            # Workspaces - Move window to workspace
            "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
            "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
            "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
            "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
            "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
            "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
            "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
            "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
            "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
            "$mainMod SHIFT, 0, movetoworkspacesilent, 10"
            "$mainMod SHIFT, s, movetoworkspacesilent, special" # Move to scratchpad
        ];

        binde = [
            # Windows - Resize
            "$mainMod CTRL, h, resizeactive, -5% 0"
            "$mainMod CTRL, j, resizeactive, 0 5%"
            "$mainMod CTRL, k, resizeactive, 0 -5%"
            "$mainMod CTRL, l, resizeactive, 5% 0"

            # Audio - Pipewire / Wireplumber
            ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
            ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
            ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
            ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle" # Mute mic

            # Brightness - brightnessctl
            ", XF86MonBrightnessUp, exec, ${pkgs.brightnessctl}/bin/brightnessctl set 10%+"
            ", XF86MonBrightnessDown, exec, ${pkgs.brightnessctl}/bin/brightnessctl set 10%-"

            # Audio + Brightness - swayOSD # TEST
            #", XF86AudioRaiseVolume, exec, ${pkgs.swayosd}/bin/swayosd --output-volume=raise"
            #", XF86AudioLowerVolume, exec, ${pkgs.swayosd}/bin/swayosd --output-volume=lower"
            #", XF86MonBrightnessUp, exec, ${pkgs.swayosd}/bin/swayosd --brightness=raise"
            #", XF86MonBrightnessDown, exec, ${pkgs.swayosd}/bin/swayosd --brightness=lower"
        ];

        bindl = [
            # Audio - playerctl # TEST
            #", XF86AudioMute, exec, ${pkgs.swayosd}/bin/swayosd --output-volume mute-toggle"
            #", XF86AudioMicMute, exec, ${pkgs.swayosd}/bin/swayosd ???" # Mute mic
            #", XF86AudioPrev, exec, playerctl previous"
            #", XF86AudioPlay, exec, playerctl play-pause"
            #", XF86AudioNext, exec, playerctl next"
            #", XF86AudioStop, exec, playerctl stop"
        ];

        bindm = [
            # Windows - Resize with Mouse
            "$mainMod, mouse:272, movewindow"
            "$mainMod, mouse:273, resizewindow"
        ];
    };
}
