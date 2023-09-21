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
      #osu-lazer-bin #osu-lazer
      
      stepmania
      gzdoom
      #clonehero # NOT WORKING (17-09-2023)
      
      ;
  };
}
