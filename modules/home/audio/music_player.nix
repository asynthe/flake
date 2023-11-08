{ pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      cmus
      ncmpcpp
      qmmp

      # Propietary
      #spotify-tui
      #spotify spotify-qt
      spicetify-cli
  };

}
