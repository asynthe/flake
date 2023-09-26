{pkgs, ...}: {
  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      davinci-resolve # Test
      kdenlive #davinci-resolve
      obs-studio
      mpv # video player
      hypnotix # tv
      ffmpeg
      mediainfo # video/audio metadata
      ;
  };
}
