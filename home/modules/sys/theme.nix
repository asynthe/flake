{ config, pkgs, ... }: {

    home = {
        packages = builtins.attrValues {
            inherit (pkgs)
	        adwaita-qt
	        dconf
	    ;
        };

        pointerCursor = {
            gtk.enable = true;
            package = pkgs.capitaine-cursors;
            name = "capitaine-cursors-white";
            size = 24;
            x11.defaultCursor = "capitaine-cursors-white";
        };
    };

    dconf = {
        enable = true;
	settings = {
	    "org/gnome/desktop/interface" = {
	        color-scheme = "prefer-dark";
	    };
	};
    };

    gtk = {
        enable = true;
        theme = {
	    name = "adwaita-dark";
	    package = pkgs.adwaita-qt;
            #name = "Materia-dark";
            #package = pkgs.materia-theme;
        };
    };

    qt = {
        enable = true;
	platformTheme = "gtk";
	style = {
	    name = "adwaita-dark";
	    package = pkgs.adwaita-qt;
            #name = "Materia-dark";
            #package = pkgs.materia-theme;
	};
    };
}
