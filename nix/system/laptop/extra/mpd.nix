{ config, pkgs, ... }:

{

  # MPD
  services.mpd = {
    enable = true;
    musicDirectory = "/home/asynthe/music";
    user = "asynthe";
    extraConfig = ''
      audio_output {
      type "pipewire"
      name "Pipewire"
      }
    '';
    startWhenNeeded = true;
  };
  systemd.services.mpd.environment = {
    XDG_RUNTIME_DIR = "/run/user/1000";
  };

}
