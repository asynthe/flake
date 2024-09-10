$mainMod=ALT
animations {
  bezier=myBezier, 0.05, 0.9, 0.1, 1.05
  animation=windows, 1, 7, myBezier
  animation=windowsOut, 1, 7, default, popin 80%
  animation=border, 1, 10, default
  animation=fade, 1, 7, default
  animation=workspaces, 1, 6, default, slide
  animation=specialWorkspace, 1, 3, default, fade
  enabled=true
}

debug {
  disable_logs=false
}

decoration {
  blur {
    enabled=true
    new_optimizations=true
    passes=3
    size=3
    special=false
    xray=false
  }
  active_opacity=1
  col.shadow=rgba(00000099)
  dim_around=0.400000
  dim_inactive=false
  dim_special=0.400000
  dim_strength=0.500000
  drop_shadow=false
  fullscreen_opacity=1
  inactive_opacity=1
  rounding=0
  shadow_ignore_window=true
  shadow_range=4
  shadow_render_power=3
}

device {
  name=razer-razer-basilisk-x-hyperspeed-1
  accel_profile=flat
  sensitivity=-0.8
}

dwindle {
  no_gaps_when_only=true
  preserve_split=true
  smart_resizing=false
  smart_split=false
  special_scale_factor=0.980000
}

general {
  border_size=1
  col.active_border=rgb(451F67)
  col.inactive_border=rgb(000000)
  gaps_in=4
  gaps_out=10
  layout=dwindle
}

gestures {
  workspace_swipe=true
}

group {
  groupbar {
    col.active=rgb(7cafc2)
    col.inactive=rgb(585858)
    text_color=rgb(d8d8d8)
  }
  col.border_active=rgb(7cafc2)
  col.border_inactive=rgb(585858)
  col.border_locked_active=rgb(86c1b9)
}

input {
  touchpad {
    natural_scroll=false
  }
  follow_mouse=1
  kb_layout=us
  kb_options=caps:swapescape
  sensitivity=0
}

master {
  inherit_fullscreen=true
  new_status=master
}

misc {
  background_color=rgb(000000)
  disable_hyprland_logo=true
  disable_splash_rendering=true
  enable_swallow=true
  initial_workspace_tracking=1
  key_press_enables_dpms=true
}

xwayland {
  force_zero_scaling=true
}
layerrule=noanim, wofi
layerrule=noanim, wshowkeys
monitor=eDP-1, 2560x1600@120, 1920x0, 1.25
monitor=HDMI-A-3, 1920x1080@60, 0x0, 1
workspace=special, border: 0
workspace=1,monitor:HDMI-A-3

# Nvidia
env=LIBVA_DRIVER_NAME,nvidia
env=GBM_BACKEND,nvidia-drm
env=__GLX_VENDOR_LIBRARY_NAME,nvidia
env=XDG_SESSION_TYPE,wayland
env=XDG_CURRENT_DESKTOP,Hyprland
env=XDG_SESSION_DESKTOP,Hyprland
env=NIXOS_OZONE_WL, 1
env=MOZ_ENABLE_WAYLAND, 1
env=HYPRCURSOR_SIZE,32
env=XCURSOR_SIZE,32

exec-once = /nix/store/xj1vfps93nk282lrs2xchc1lwr5rc5n0-dbus-1.14.10/bin/dbus-update-activation-environment --systemd --all && systemctl --user stop graphical-session.target && systemctl --user start hyprland-session.target

exec-once=sleep 1 && swww-daemon &
exec-once=/nix/store/r0y883i4m2spih4aqm9mi5mscw64bpzr-polkit-kde-agent-1-5.27.11/libexec/polkit-kde-authentication-agent-1 &
exec-once=mullvad-gui &
exec-once=qbittorrent &
exec-once=waybar &
exec-once=fcitx5 -d &

bind=$mainMod SHIFT, return, exec, [tile] alacritty
bind=$mainMod, p, exec, pkill /nix/store/2df10damddhn068fii7zpxv9zqlf8b51-wofi-1.4.1/bin/wofi || /nix/store/2df10damddhn068fii7zpxv9zqlf8b51-wofi-1.4.1/bin/wofi --show drun
bind=$mainMod, v, exec, [float] pkill /nix/store/a119qvpq613nyfic16qsw0sn58a7x4j0-pavucontrol-6.0/bin/pavucontrol || /nix/store/a119qvpq613nyfic16qsw0sn58a7x4j0-pavucontrol-6.0/bin/pavucontrol
bind=SUPER, s, exec, /nix/store/ds1b56xs9wpwqbmz6hwpgsfgb274nfih-hyprshot-1.3.0/bin/hyprshot --raw --mode region | /nix/store/3n9nvchxmlfjvbhvxm7j32smfa58brjv-swappy-1.5.1/bin/swappy --file -
bind=SUPER SHIFT, s, exec, /nix/store/ds1b56xs9wpwqbmz6hwpgsfgb274nfih-hyprshot-1.3.0/bin/hyprshot --raw --mode window | /nix/store/3n9nvchxmlfjvbhvxm7j32smfa58brjv-swappy-1.5.1/bin/swappy --file -
bind=SUPER CTRL, s, exec, /nix/store/ds1b56xs9wpwqbmz6hwpgsfgb274nfih-hyprshot-1.3.0/bin/hyprshot --raw --mode output | /nix/store/3n9nvchxmlfjvbhvxm7j32smfa58brjv-swappy-1.5.1/bin/swappy --file -
bind=$mainMod SHIFT, c, killactive,
bind=$mainMod SHIFT, o, exit,
bind=$mainMod SHIFT, p, pin,
bind=$mainMod SHIFT, f, togglefloating,
bind=$mainMod SHIFT, m, togglefloating,
bind=$mainMod, d, togglesplit,
bind=$mainMod, f, fullscreen,
bind=$mainMod, m, fullscreen,
bind=$mainMod, o, pseudo,
bind=$mainMod, h, movefocus, l
bind=$mainMod, j, movefocus, d
bind=$mainMod, k, movefocus, u
bind=$mainMod, l, movefocus, r
bind=$mainMod SHIFT, h, movewindow, l
bind=$mainMod SHIFT, j, movewindow, d
bind=$mainMod SHIFT, k, movewindow, u
bind=$mainMod SHIFT, l, movewindow, r
bind=$mainMod, comma, focusmonitor, -1
bind=$mainMod, period, focusmonitor, +1
bind=$mainMod SHIFT, comma, workspace, e-1
bind=$mainMod SHIFT, period, workspace, e+1
bind=$mainMod, mouse_up, workspace, e-1
bind=$mainMod, mouse_down, workspace, e+1
bind=$mainMod, 1, workspace, 1
bind=$mainMod, 2, workspace, 2
bind=$mainMod, 3, workspace, 3
bind=$mainMod, 4, workspace, 4
bind=$mainMod, 5, workspace, 5
bind=$mainMod, 6, workspace, 6
bind=$mainMod, 7, workspace, 7
bind=$mainMod, 8, workspace, 8
bind=$mainMod, 9, workspace, 9
bind=$mainMod, 0, workspace, 10
bind=$mainMod, s, togglespecialworkspace
bind=$mainMod SHIFT, 1, movetoworkspacesilent, 1
bind=$mainMod SHIFT, 2, movetoworkspacesilent, 2
bind=$mainMod SHIFT, 3, movetoworkspacesilent, 3
bind=$mainMod SHIFT, 4, movetoworkspacesilent, 4
bind=$mainMod SHIFT, 5, movetoworkspacesilent, 5
bind=$mainMod SHIFT, 6, movetoworkspacesilent, 6
bind=$mainMod SHIFT, 7, movetoworkspacesilent, 7
bind=$mainMod SHIFT, 8, movetoworkspacesilent, 8
bind=$mainMod SHIFT, 9, movetoworkspacesilent, 9
bind=$mainMod SHIFT, 0, movetoworkspacesilent, 10
bind=$mainMod SHIFT, s, movetoworkspacesilent, special
binde=$mainMod CTRL, h, resizeactive, -5% 0
binde=$mainMod CTRL, j, resizeactive, 0 5%
binde=$mainMod CTRL, k, resizeactive, 0 -5%
binde=$mainMod CTRL, l, resizeactive, 5% 0
binde=, XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+
binde=, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
binde=, XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
binde=, XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
binde=, XF86MonBrightnessUp, exec, /nix/store/xcjbji4cnqcg4phg1dfdggkplwcv4kmn-brightnessctl-0.5.1/bin/brightnessctl set 10%+
binde=, XF86MonBrightnessDown, exec, /nix/store/xcjbji4cnqcg4phg1dfdggkplwcv4kmn-brightnessctl-0.5.1/bin/brightnessctl set 10%-
bindm=$mainMod, mouse:272, movewindow
bindm=$mainMod, mouse:273, resizewindow

windowrulev2=noanim, floating: 1
windowrulev2=center, class:(chromium), title:(Save File)
windowrulev2=float, class:(chromium), title:(Save File)
windowrulev2=noborder, class:(chromium), title:(Save File)
windowrulev2=opacity 1.0 override 1.0 override, class:(Save File)
windowrulev2=opacity 1.0 override 1.0 override, class:(chromium)
windowrulev2=opacity 1.0 override 1.0 override, class:^(librewolf)$
windowrulev2=idleinhibit focus, class:^(librewolf)$, title:^(.*YouTube.*)$
windowrulev2=idleinhibit fullscreen, class:^(librewolf)$
windowrulev2=opacity 1.0 override 1.0 override, title:^(Enter name of file to save to...)$
windowrulev2=center, title:^(Enter name of file to save to...)$
windowrulev2=noanim, title:^(Enter name of file to save to...)$
windowrulev2=noborder, title:^(Enter name of file to save to...)$
windowrulev2=center, title:^(Picture-in-Picture)$
windowrulev2=float, title:^(Picture-in-Picture)$
windowrulev2=noanim, title:^(Picture-in-Picture)$
windowrulev2=noborder, title:^(Picture-in-Picture)$
windowrulev2=nodim, title:^(Picture-in-Picture)$
windowrulev2=nodim, title:^(ピクチャーインピクチャー)$
windowrulev2=opacity 1.0 override 1.0 override, title:^(Picture-in-Picture)$
windowrulev2=pin, title:^(Picture-in-Picture)$
windowrulev2=float, class:^(Hypnotix.py)$
windowrulev2=idleinhibit always, class:^(Hypnotix.py)$
windowrulev2=pin, class:^(Hypnotix.py)$
windowrulev2=float, class:^(org.keepassxc.KeePassXC)$
windowrulev2=noanim, class:^(org.keepassxc.KeePassXC)$
windowrulev2=opacity 1.0 override 1.0 override, class:^(mpv)$
windowrulev2=idleinhibit focus, class:^(mpv)$
windowrulev2=idleinhibit fullscreen, class:^(mpv)$
windowrulev2=float, title:(Mullvad VPN)
windowrulev2=noanim, title:(Mullvad VPN)
windowrulev2=noborder, title:(Mullvad VPN)
windowrulev2=opacity 1.0 override 1.0 override, title:(Mullvad VPN)
windowrulev2=workspace 10 silent, title:(Mullvad VPN)
windowrulev2=float, class:^(pavucontrol)$
windowrulev2=noanim, class:pavucontrol.*$
windowrulev2=noborder, class:^(pavucontrol)$
windowrulev2=center, class:^(pavucontrol)$
windowrulev2=size 800 500, class:^(pavucontrol)$
windowrulev2=workspace 10 silent, class:^(org.qbittorrent.qBittorrent)$
windowrulev2=noanim, class:^(org.qbittorrent.qBittorrent)$
windowrulev2=idleinhibit always, class:^(steam)$
windowrulev2=minsize 1 1, title:^()$,class:^(steam)$
windowrulev2=stayfocused, title:^()$,class:^(steam)$
windowrulev2=float, title:^(Waydroid)$
windowrulev2=float, class:^(org.wezfurlong.wezterm)$
windowrulev2=tile, class:^(org.wezfurlong.wezterm)$
windowrulev2=opacity 1.0 override 1.0 override, class:(org.pwmt.zathura)$
windowrulev2=float, class:^(Vmware)$
windowrulev2=opacity 1.0 override 1.0 override, class:^(Vmware)$
windowrulev2=center, class:^(org.kde.polkit-kde-authentication-agent-1)$
windowrulev2=float, class:^(org.kde.polkit-kde-authentication-agent-1)$
windowrulev2=float, class:^(org.qgis.)$
windowrulev2=float, title:^(Media viewer)$
windowrulev2=workspace special silent, title:^(Firefox — Sharing Indicator)$
windowrulev2=workspace special silent, title:^(.*is sharing (your screen|a window).)$
