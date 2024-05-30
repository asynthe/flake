{ config, lib, pkgs, ... }: {
    stylix = {
        autoEnable = true;
        polarity = "dark";
        base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
        #opacity = {
            #applications = 1.0;
            #terminal = 1.0;
            #desktop = 1.0;
            #popups = 1.0;
        #};
        cursor = {
            package = pkgs.capitaine-cursors;
            name = "capitaine-cursors-white";
            size = 24; # default `32`.
        };
        fonts = {
            # Monospace for everything.
            #serif = config.stylix.fonts.monospace;
            #sansSerif = config.stylix.fonts.monospace;
            #emoji = config.stylix.fonts.monospace;
            packages = [
                pkgs.dejavu_fonts
                pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; }
                pkgs.noto-fonts-emoji
            ];

            serif = {
                #package = pkgs.dejavu_fonts;
                name = "DejaVu Serif";
            };

            sansSerif = {
                #package = pkgs.dejavu_fonts;
                name = "DejaVu Sans";
            };

            monospace = {
                #package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
                name = "JetBrainsMono Nerd Font Mono";
            };

            emoji = {
                #package = pkgs.noto-fonts-emoji;
                name = "Noto Color Emoji";
            };
        };
    };
}
