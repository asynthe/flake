{ config, username, ... }: {

  services.mpd = {
    enable = true;
    user = "${username}";
    musicDirectory = "/home/${username}/music";
    #extraConfig = ''
    #  audio_output {
    #  type "pipewire"
    #  name "Pipewire"
    #  }
    #'';
    startWhenNeeded = true;
  };
  systemd.services.mpd.environment = {
    XDG_RUNTIME_DIR = "/run/user/1000";
  };
}
