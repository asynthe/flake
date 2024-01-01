{ pkgs, ... }: {
  
  home.packages = builtins.attrValues {
    inherit (pkgs)
      obs-studio
      wf-recorder # Wayland
      #davinci-resolve # Not working (Hash issue?)
      #kdenlive
      mpv # Video player.
      hypnotix # TV.
      ffmpeg
      mediainfo # Video/audio metadata.
      ;
  };
}
