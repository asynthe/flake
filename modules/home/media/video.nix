{pkgs, ...}: {
  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      #davinci-resolve # Not working (Hash issue?)
      kdenlive
      obs-studio
      mpv # video player
      hypnotix # tv
      ffmpeg
      mediainfo # video/audio metadata
      wf-recorder # Wayland
      ;
  };
}
