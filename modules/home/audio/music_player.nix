{ pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      cmus
      ncmpcpp
      qmmp

      # Music player
      playerctl # Manage audio daemon

      # Propietary
      #spotify-tui
      spotify #spotify-qt
      #spicetify-cli
      ;
  };

}
