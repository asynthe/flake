{ pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      cmus
      #ncmpcpp mpd
      qmmp

      # Propietary
      #spotify-tui
      spotify spotify-qt
      spicetify-cli
      ;
  };
}
