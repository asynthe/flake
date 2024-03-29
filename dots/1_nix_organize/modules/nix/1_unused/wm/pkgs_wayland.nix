{ config, pkgs, ... }: {

  environment.systemPackages = builtins.attrValues {
    inherit
      (pkgs)

      # Wayland compositors
      #wayfire
      
      # Apps
      wofi #bemenu # App launcher
      waybar # Bar
      swayidle # Idle daemon
      imv # Image viewer
      grim slurp # Simple screenshot
      mako libnotify # Notification daemon
      swww #wpaperd # Wallpaper daemon
      mpvpaper # video wallpaper
      wdisplays #wlr-randr #kanshi
      brightnessctl #brillo
      wl-clipboard
      pass-wayland # password manager
      
      # Lock Screen
      gtklock
      #swaylock-effects
      #wlogout
      #eww-wayland # status bar

      # NWG test
      #nwg-bar
      #nwg-menu
      #nwg-panel
      #nwg-drawer
      #nwg-wrapper
      #nwg-launchers  
      ;

    inherit
      (pkgs.libsForQt5)
      polkit-kde-agent
      ; # Authentication Agent

    inherit (pkgs.libsForQt5.qt5) qtwayland;
    #inherit (pkgs.qt6) qtwayland; # Qt Wayland Support
    #inherit (pkgs.xorg) xlsclients; # Check for apps running on xwayland
  };

}
