{ pkgs, ... }: {

  #programs.ncmpcpp = {
    #enable = true;
    #mpdMusicDir = ; # The value of services.mpd.musicDirectory is used as default.
  };

  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      cmus
      qmmp
      ncmpcpp

      # Music player
      playerctl # Manage audio daemon

      # Propietary
      #spotify-tui
      spotify #spotify-qt
      #spicetify-cli
      ;
  };

}
