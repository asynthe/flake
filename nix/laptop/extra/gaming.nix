{
  config,
  pkgs,
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

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    mangohud # Vulkan and OpenGL overlay for monitoring

    # FRONTENDS
    lutris #lutris-free #lutris-unwrapped

    # STEAM
    #steam
    steam-tui
    gamescope
    steamtinkerlaunch
    #steamPackages.steamcmd
    #steamPackages.steam-runtime
    #steamPackages.steam-runtime-wrapped

    # PROTON
    protontricks
    protonup-qt
    protonup-ng
    xboxdrv

    # GAMES
    minecraft #minecraft-server
    #osu-lazer osu-lazer-bin
    stepmania
    gzdoom
    #clonehero # NOT WORKING (22-05-2023)
  ];
}
