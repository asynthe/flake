{
  pkgs,
  lib,
  ...
}: {
  fonts.fontconfig.enable = lib.mkForce true;
  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      source-code-pro
      font-awesome
      #iosevka-comfy.comfy
      
      corefonts
      nerdfonts
      # Japanese
      
      ipafont
      kochi-substitute
      ;
  };
}
