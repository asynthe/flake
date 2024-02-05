{ pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit (pkgs)

      # Music player
      cmus

      # Propietary
      #spotify-tui
      spotify #spotify-qt
      #spicetify-cli
      qmmp
      ;
  };
}
