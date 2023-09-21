{pkgs, ...}: {
  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      kdenlive #davinci-resolve
      obs-studio
      mpv # video player
      hypnotix # tv
      ffmpeg
      mediainfo # video/audio metadata
      ;
  };
}
