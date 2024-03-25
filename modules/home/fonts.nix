{ config, pkgs, ... }: {

    fonts.fontconfig.enable = true;

    home.packages = builtins.attrValues {
        inherit (pkgs)

	    corefonts
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
