{
  pkgs,
  lib,
  ...
}: {
  # Just as a note, if it's not working do a `fc-cache -f`

  fonts.fontconfig.enable = lib.mkForce true;
  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      source-code-pro
      font-awesome
      corefonts
      nerdfonts
      # Japanese
      
      ipafont
      kochi-substitute
      ;
    inherit
      (pkgs.iosevka-comfy)
      comfy
      ;
  };
}
