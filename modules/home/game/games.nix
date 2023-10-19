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
      osu-lazer # AppImage version for score submission and multiplayer.
      #osu-lazer-bin  # Binary for Darwin systems.
      
      stepmania
      gzdoom
      #clonehero # NOT WORKING (17-09-2023)
      
      ;
  };
}
