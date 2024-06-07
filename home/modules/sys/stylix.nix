{ lib, pkgs, ... }: {

    # Overrides
    wayland.windowManager.hyprland.settings.general = {
        "col.active_border" = lib.mkForce "rgb(451F67)"; # Purple
        #"col.active_border" = lib.mkForce "rgb(ff0000)"; # Xmonad Red
        "col.inactive_border" = lib.mkForce "rgb(000000)"; # Black
    };
    #programs.alacritty.settings.colors.primary.background = lib.mkForce "0x000000";

    stylix = {
        autoEnable = true;
        polarity = "dark";
        image = ./img/nixos_logo.png;

        # https://tinted-theming.github.io/base16-gallery/
        # or `nix build nixpkgs#base16-schemes`
        #base16Scheme = "${pkgs.base16-schemes}/share/themes/default-dark.yaml";
        base16Scheme = {
            #base00 = "181818";
            base00 = "000000";
            base01 = "282828";
            base02 = "383838";
            base03 = "585858";
            base04 = "b8b8b8";
            base05 = "d8d8d8";
            base06 = "e8e8e8";
            base07 = "f8f8f8";
            base08 = "ab4642";
            base09 = "dc9656";
            base0A = "f7ca88";
            base0B = "a1b56c";
            base0C = "86c1b9";
            base0D = "7cafc2";
            base0E = "ba8baf";
            base0F = "a16946";
        };

        opacity = {
            #applications = 1.0;
            terminal = 0.8;
            #desktop = 1.0;
            #popups = 1.0;
        };
        cursor = {
            package = pkgs.capitaine-cursors;
            name = "capitaine-cursors-white";
            size = 18; # default `32`.
        };
        fonts = {
            sizes = {
                desktop = 6; # default `10`.
                popups = 10; # default `10`.
                terminal = 14; # default `12`.
            };
            # Monospace for everything.
            #serif = config.stylix.fonts.monospace;
            #sansSerif = config.stylix.fonts.monospace;
            #emoji = config.stylix.fonts.monospace;
            
            # ???
            #packages = builtins.attrValues {
                #inherit (pkgs)
                    #dejavu_fonts
                    #etBook # https://edwardtufte.github.io/et-book/
                    #font-awesome
                    #nerdfonts
                    #noto-fonts-emoji
                    #office-code-pro
                    #source-sans-pro
                #;
            #};

            #packages = [ # DELETE
                #pkgs.dejavu_fonts
                #pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; }
                #pkgs.noto-fonts-emoji
            #];

            serif = {
                package = pkgs.dejavu_fonts;
                name = "DejaVu Serif";
            };

            sansSerif = {
                package = pkgs.dejavu_fonts;
                name = "DejaVu Sans";
            };

            monospace = {
                package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
                name = "JetBrainsMono Nerd Font Mono";
            };

            emoji = {
                package = pkgs.noto-fonts-emoji;
                name = "Noto Color Emoji";
            };
        };

        targets = {
            nixvim.transparent_bg.main = true;
            #nixvim.transparent_bg.sign_column = true;
        };
    };

    # -------------------------------------------------
    # Theme

    dconf.enable = true;
    #home = {
        #pointerCursor = {
            #gtk.enable = true;
            #package = pkgs.capitaine-cursors;
            #name = "capitaine-cursors-white";
            #size = 24;
            #x11.defaultCursor = "capitaine-cursors-white";
        #};
    #};

    #gtk = {
        #enable = true;
        #theme = {
	        #name = "Adwaita-dark";
            #package = pkgs.adwaita-qt;

            #name = "Materia-dark";
            #package = pkgs.materia-theme;
        #};
    #};

    #qt = {
        #enable = true;
	    #platformTheme.name = "gtk";
    #};
}
