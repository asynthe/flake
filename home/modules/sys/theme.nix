{ config, pkgs, ... }: {

    home = {
        pointerCursor = {
            gtk.enable = true;
            package = pkgs.capitaine-cursors;
            name = "capitaine-cursors-white";
            size = 24;
            x11.defaultCursor = "capitaine-cursors-white";
        };
    };

    gtk = {
        enable = true;
        theme = {
            name = "Materia-dark";
            package = pkgs.materia-theme;
	    #name = "Adwaita-dark";
	    #package = pkgs.adwaita-qt;
        };
    };

    qt = {
        enable = true;
	platformTheme = "gtk";
    };

    dconf.enable = true;
    fonts.fontconfig.enable = true;
    home.packages = builtins.attrValues {
        inherit (pkgs)

	    #corefonts
	    font-awesome
	    nerdfonts

	    # Japanese
	    ipafont
	    kochi-substitute
	    noto-fonts
	    noto-fonts-cjk
	    noto-fonts-emoji
	;
    };
}
