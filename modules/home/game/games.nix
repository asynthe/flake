{ pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit (pkgs)

      #minecraft #minecraft-server
      #gzdoom

      # Rhythm
      stepmania
      #osu-lazer # No score submission or multiplayer.
      osu-lazer-bin # AppImage version for score submission and multiplayer and also for Darwin systems.
      #clonehero # NOT WORKING (17-09-2023)
      ;
  };
}
