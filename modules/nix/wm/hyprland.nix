{
  config,
  inputs,
  pkgs,
  ...
}: {
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    enableNvidiaPatches = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = builtins.attrValues {
      inherit
        (pkgs)
        #xdg-desktop-portal-hyprland # Gives me error.
        xdg-desktop-portal-gtk # GTK portal needed to make gtk apps happy.
        ;
    };
  };

  # Polkit
  security.polkit = {
    enable = true;
    #debug = true;
    #extraConfig = ''
    #''
  };

  environment.systemPackages = builtins.attrValues {
    inherit
      (pkgs)
      # Apps
      
      eww-wayland # status bar
      wofi #bemenu
      gtklock # lock screen
      swayidle # idle daemon
      imv # image viewer
      nsxiv # image viewer (X11)
      grim
      slurp # simple screenshot
      mako
      libnotify # notification daemon
      wlogout
      pass-wayland # password manager
      
      swww #wpaperd # wallpaper daemon
      mpvpaper # video wallpaper
      
      wl-clipboard
      wdisplays #wlr-randr #kanshi
      brightnessctl #brillo
      
      # Must have
      
      polkit
      # Testing
      
      waybar
      # Not used
      
      #nwg-bar
      
      #nwg-menu
      
      #nwg-panel
      
      #nwg-drawer
      
      #nwg-wrapper
      
      #nwg-launchers
      
      #swaylock-effects
      
      ;

    inherit
      (pkgs.libsForQt5)
      polkit-kde-agent
      ; # Authentication Agent

    inherit (pkgs.libsForQt5.qt5) qtwayland;
    #inherit (pkgs.qt6) qtwayland; # Qt Wayland Support
    inherit (pkgs.xorg) xlsclients; # Check for apps running on xwayland
  };
}
