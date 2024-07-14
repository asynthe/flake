{ pkgs, inputs, ... }: let
    monitor1 = "eDP-1";
    monitor2 = "HDMI-A-2";
in {
    wayland.windowManager.hyprland.settings = {
        xwayland.force_zero_scaling = true; # Xwayland apps look like shit when scaled.

        exec-once = [
            "${pkgs.fcitx5}/bin/fcitx5 -d &"
            "${pkgs.libsForQt5.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1 &"
            "mullvad-gui"
        ];

        env = [
            # NOT FROM THIS CONFIG
            # Prioritise first card (which for me is the amd iGPU)
            #"WLR_DRM_DEVICES,/dev/dri/card0"
            #"LIBVA_DRIVER_NAME,nvidia"
            #"__GLX_VENDOR_LIBRARY_NAME,nvidia"

            "XDG_SESSION_TYPE,wayland"
            "XDG_CURRENT_DESKTOP,Hyprland"
            "XDG_SESSION_DESKTOP,Hyprland"

            "MOZ_ENABLE_WAYLAND, 1" # Firefox in Wayland.
            "NIXOS_OZONE_WL, 1"

            # Cursor
            "WLR_NO_HARDWARE_CURSORS, 1" # Fix for cursor not appearing when using nvidia drivers.
            "HYPRCURSOR_SIZE,32"
            "XCURSOR_SIZE,32"

        ];

        monitor = [

            # eDP-1 on the left
            #"${monitor1}, 1920x1080@60, 0x0, 1" # Last one is scaling, I use 1.20 sometimes.
            #"${monitor2}, 1920x1080@60, 1920x0, 1"

            # eDP-1 on the right
            "${monitor1}, 1920x1080@60, 1920x0, 1"
            "${monitor2}, 1920x1080@60, 0x0, 1"

            # Disable eDP-1
            #"${monitor1}, disable"

            # Vertical
            #"${monitor2}, 1920x1080@60, 0x0, 1, transform, 1"
        ];
        workspace = [
            "special, border: 0"
            "1,monitor:HDMI-A-2" # Make monitor take wksp 1 when connected
        ];

        device = {
            # Old Razer Hyperspeed X mouse
            name = "razer-razer-basilisk-x-hyperspeed-1";
            #name = "razer-razer-basilisk-x-hyperspeed";
            sensitivity = "-0.8"; # from -1.0 to 1.0, default 0.0
            accel_profile = "flat";
        };

        general = {
            layout = "dwindle";
            gaps_in = 4; # prev 4
            gaps_out = 10; # prev 10
            border_size = 1;
            #no_border_on_floating = 1;

            # Border color -> Stylix
            #"col.active_border" = "rgb(451F67)"; # Purple # Stylix
            #col.active_border = "rgb(ff0000)"; # Xmonad Red # Stylix
            #"col.inactive_border" = "rgb(000000)"; # Black # Stylix
        };

        # Animations
        # See more at https://wiki.hyprland.org/Configuring/Animations
        # Anymations types: slide, slidevert, fade, slidefade, slidefadevert.
        animations = {
            enabled = true;
            bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
            animation = [
                "windows, 1, 7, myBezier"
                "windowsOut, 1, 7, default, popin 80%"
                "border, 1, 10, default"
                "fade, 1, 7, default"
                "workspaces, 1, 6, default, slide"
                "specialWorkspace, 1, 3, default, fade"
            ];
        };

        dwindle = {
            preserve_split = true;
            no_gaps_when_only = true; # Smart gaps, no gaps when only one window.
            smart_split = false;
            smart_resizing = false;
            special_scale_factor = 0.98; # Scale of special workspace windows.
        };

        master = {
            new_status = "master"; # master, slave, inherit.
            inherit_fullscreen = true;
            #no_gaps_when_only = true; # Smart gaps, no gaps when only one window.
        };

        gestures = {
            workspace_swipe = true;
        };

        decoration = {
            rounding = 0;
            active_opacity = 1;
            inactive_opacity = 1; # prev 0.82
            fullscreen_opacity = 1;

            # Blur
            blur = {
                enabled = true;
                size = 3;
                passes = 3;
                new_optimizations = true;
                xray = false; # Terminal see-through apps.
                special = false;
            };

            # Shadows
            drop_shadow = false;
            shadow_range = 4;
            shadow_render_power = 3;
            shadow_ignore_window = true;
            #"col.shadow" = "rgba(1a1a1aee)"; # Stylix
            #"col.shadow_inactive" = "...";

            # Dim
            dim_inactive = false;
            dim_strength = 0.5;
            dim_around = 0.4;
            dim_special = 0.4;
        };

        # Misc
        misc = {
            initial_workspace_tracking = 1; # Only first window. (2 for window + children)
            key_press_enables_dpms = true;

            # Cursor
            #inactive_timeout = 3;
            #hide_on_key_press = true; # Hide cursor on key press.

            # Window Swallowing
            enable_swallow = true;
            #swallow_regex = "^(Alacritty|kitty|org.wezfurlong.wezterm)$"; # works btw

            # Hyprland logo
            disable_hyprland_logo = true;
            disable_splash_rendering = true;
            #force_hypr_change = false;

            # VRR (Variable Refresh Rate)
            # https://wiki.archlinux.org/title/Variable_refresh_rate
            # Requires a monitor with G-SYNC (NVIDIA) or FreeSync (AMD).
            #vrr = 1;
        };
    };
}
