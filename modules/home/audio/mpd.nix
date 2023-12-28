{ config, pkgs, username, ... }: {

  services.mpd = {
    enable = true;
    musicDirectory = "/home/${username}/music";
  };

  services.mpd.network.startWhenNeeded = true; # Enable socket activation.

}
