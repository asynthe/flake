{ config, inputs, lib, pkgs, ... }: {

    wayland.windowManager.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.system}.hyprland;

        xwayland.enable = true;

        systemd = {
            enable = true;
            extraCommands = lib.mkBefore [
                "systemctl --user stop graphical-session.target"
                "systemctl --user start hyprland-session.target"
            ];
        };

        settings = {

            #exec-once = wl-clipboard-history -t
            xwayland.force_zero_scaling = true; # Xwayland apps look like shit when scaled.

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

                #"MOZ_ENABLE_WAYLAND,1"
            ];

            general = {
                layout = "dwindle";
                gaps_in = 4;
                gaps_out = 10;
                border_size = 1;
                #border_size = 0;
                #no_border_on_floating = 1;

                # Border color - Active Border
                col.active_border = "rgb(451F67)"; # Purple
                #col.active_border = "rgb(ff0000)"; # Xmonad Red

                # Border color - Inactive Border
                col.inactive_border = "rgb(000000)"; # Black
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
        };
    };
}
