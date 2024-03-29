{ config, pkgs, ... }: {

  fonts = {
    packages = builtins.attrValues {
      inherit (pkgs)
        source-code-pro
        font-awesome
        corefonts
        nerdfonts
	
        # Japanese
        ipafont
        kochi-substitute
	;
      };

    #fontconfig.defaultFonts = {
      #monospace = ["DejaVu Sans Mono" "IPAGothic"];
      #sansSerif = ["DejaVu Sans" "IPAPGothic"];
      #serif = ["DejaVu Serif" "IPAPMincho"];
    #};
  };
}
