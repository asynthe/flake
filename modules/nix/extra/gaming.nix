{
  config,
  username,
  ...
}: {
  # STEAM

  programs.steam = {
    enable = true;
    #remotePlay.openFirewall = true; # Open ports for Steam Remote Play.
    #dedicatedServer.openFirewall = true; # Open ports for Source Dedicated Server.
  };

  hardware = {
    xone.enable = true; # Xbox one controller drivers.
    #steam-hardware.enable = true; # Already enabled with programs.steam.enable = true;
  };

  # Gamemode - better performance on games. Use with gamemoderun.
  users.users.${username}.extraGroups = ["gamemode"];
  #programs.gamemode = {
  #enable = true;
  #enableRenice = true;
  #settings = ;
  #};
}
