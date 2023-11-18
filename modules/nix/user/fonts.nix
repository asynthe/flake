{ config, pkgs, ... }: 
{
  # Fonts
  fonts = {
    packages = with pkgs; [
      source-code-pro
      font-awesome
      iosevka-comfy.comfy
      corefonts
      nerdfonts
      # Japanese
      ipafont
      kochi-substitute
    ];

    #fontconfig.defaultFonts = {
      #monospace = ["DejaVu Sans Mono" "IPAGothic"];
      #sansSerif = ["DejaVu Sans" "IPAPGothic"];
      #serif = ["DejaVu Serif" "IPAPMincho"];
    #};
  };
}
