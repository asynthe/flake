{ pkgs, ... }: let

    monitor1 = "eDP-1";
    monitor2 = "HDMI-A-2";

in {
    wayland.windowManager.hyprland.settings = {
        xwayland.force_zero_scaling = true; # Xwayland apps look like shit when scaled.

        exec-once = [
            "${pkgs.fcitx5}/bin/fcitx5 -d &"
            "${pkgs.swww}/bin/swww init &"
            #"${pkgs.waybar}/bin/waybar"
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

            "WLR_NO_HARDWARE_CURSORS,1" # Fix for cursor not appearing when using nvidia drivers.
            "MOZ_ENABLE_WAYLAND,1" # Firefox in Wayland.
        ];

        monitor = [
            "${monitor1}, 1920x1080@60, 0x0, 1.20"
            "${monitor2}, 1920x1080@60, 1920x0, 1"
        ];

        general = {
            layout = "dwindle";
            gaps_in = 4;
            gaps_out = 10;
            border_size = 1;
            #border_size = 0;
            #no_border_on_floating = 1;

            # Border color
            "col.active_border" = "rgb(451F67)"; # Purple
            #col.active_border = "rgb(ff0000)"; # Xmonad Red
            "col.inactive_border" = "rgb(000000)"; # Black
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
            #no_gaps_when_only = true; # Smart gaps, no gaps when only one window.
            smart_split = false;
            smart_resizing = false;
            special_scale_factor = 0.97; # Scale of special workspace windows.
        };

        master = {
            new_is_master = true;
            inherit_fullscreen = true;
            #no_gaps_when_only = true; # Smart gaps, no gaps when only one window.
        };

        gestures = {
            workspace_swipe = true;
        };

        decoration = {
            rounding = 0;
            active_opacity = 1;
            inactive_opacity = 1;
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
            "col.shadow" = "rgba(1a1a1aee)";
            #"col.shadow_inactive" = "...";

            # Dim
            dim_inactive = false;
            dim_strength = 0.5;
            dim_around = 0.4;
            dim_special = 0.4;
        };

        # Misc
        misc = {
            initial_workspace_tracking = 2; # Persistent, window + children.
            #hide_on_key_press = true; # Hide cursor on key press.

            # Window Swallowing
            enable_swallow = true;
            swallow_regex = "^(Alacritty|kitty)$";

            # Hyprland logo
            disable_hyprland_logo = true;
            #force_hypr_change = false;
            disable_splash_rendering = true;

            # VRR (Variable Refresh Rate)
            # https://wiki.archlinux.org/title/Variable_refresh_rate
            # Requires a monitor with G-SYNC (NVIDIA) or FreeSync (AMD).
            vrr = 1;
        };
    };
}
