{ pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit (pkgs)
      gimp-with-plugins #gimp # Replaced for flatpak gimp + photogimp.
      #krita
      #inkscape-with-extensions #inkscape
      #darktable
      #rawtherapee # RAW images editor.
      
      imagemagick # Image editing.
      exif # Image metadata.
      ;
  };
}
