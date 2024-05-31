{ config, inputs, lib, pkgs, ... }: {

    stylix = {
        autoEnable = true;
        polarity = "dark";
        image = ./img/nixos_logo.png;

        # https://tinted-theming.github.io/base16-gallery/
        # or `nix build nixpkgs#base16-schemes`
        base16Scheme = "${pkgs.base16-schemes}/share/themes/irblack.yaml";

        opacity = {
            #applications = 1.0;
            terminal = 0.8;
            #desktop = 1.0;
            #popups = 1.0;
        };
        cursor = {
            package = pkgs.capitaine-cursors;
            name = "capitaine-cursors-white";
            size = 20; # default `32`.
        };
        fonts = {
            sizes = {
                desktop = 6; # default `10`.
                popups = 10; # default `10`.
                terminal = 12; # default `12`.
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
    # Fonts

    #fonts.fontconfig = {
        #enable = true;
        #defaultFonts = {
            #emoji = ...;
            #monospace = ...;
            #sansSerif = ...;
            #serif = ...;
        #};
    #};

    home.packages = builtins.attrValues {
        inherit (pkgs)
            corefonts
            etBook # https://edwardtufte.github.io/et-book/
            font-awesome
            nerdfonts
            office-code-pro
            source-sans-pro
            #(nerdfonts.override { fonts = [  # DELETE -> HOME
              #"FiraCode"
              #"FiraMono"
              #"Iosevka"
              #"IosevkaTerm"
              #"JetBrainsMono"
              #"Meslo"
            #]; })
        ;
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
