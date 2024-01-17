{ config, ... }: {

  # STEAM
  programs.steam = {
    enable = true;
    #remotePlay.openFirewall = true; # Open ports for Steam Remote Play.
    #dedicatedServer.openFirewall = true; # Open ports for Source Dedicated Server.
  };

  # Already enabled with programs.steam.enable = true;
  #hardware.steam-hardware.enable = true; 

}
