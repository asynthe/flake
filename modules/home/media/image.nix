{pkgs, ...}: {
  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      darktable
      rawtherapee
      #inkscape-with-extensions #inkscape
      
      gimp-with-plugins #gimp # Replaced for flatpak gimp + photogimp.
      #krita
      
      imagemagick # image editing
      exif # image metadata
      ;
  };
}
