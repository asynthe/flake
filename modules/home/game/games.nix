{pkgs, ...}: {
  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      # Tools
      
      mangohud # Vulkan and OpenGL overlay for monitoring.
      lutris #lutris-free #lutris-unwrapped # Frontend to manage games.
      gamemode # Better performance on games, use with `gamemoderun`.
      
      # Games
      minecraft #minecraft-server
      stepmania
      #osu-lazer # No score submission or multiplayer.
      osu-lazer-bin # AppImage version for score submission and multiplayer and also for Darwin systems.
      gzdoom
      #clonehero # NOT WORKING (17-09-2023)
      ;
  };
}
