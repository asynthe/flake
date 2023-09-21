{pkgs, ...}: {
  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      # Steam
      
      steam
      steam-tui
      gamescope
      steamtinkerlaunch
      # Proton
      
      protontricks
      protonup-qt
      protonup-ng
      xboxdrv
      ;
    inherit
      (pkgs.steamPackages)
      steamcmd
      #steam-runtime
      
      #steam-runtime-wrapped
      
      ;
  };
}
