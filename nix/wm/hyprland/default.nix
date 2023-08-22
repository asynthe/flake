{ pkgs, inputs, ... }: {

  programs.hyprland = {
    enable = true;
    #package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    enableNvidiaPatches = true;
    #xwayland = {
      #enable = true;
      #hidpi = true;
    #};
  };

  # Environment variables for Hyprland
  environment.variables = {
    NIXOS_OZONE_WL = "1";
  };

  xdg = {
    #sounds.enable = true;
    #icons.enable = true;
    #autostart.enable = true;
    portal = {
      enable = true;
      #xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
      #xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk # GTK portal needed to make gtk apps happy.
      ];
      #wlr.enable = true; # Adds xdg-desktop-portal-wlr into extraPortals.
      #wlr.settings = ;
    };
  };

  environment.systemPackages = with pkgs; [

    # Hyprland related
    hyprland-protocols
    hyprland-share-picker
    #xdg-desktop-portal-hyprland

    # Apps
    eww-wayland # status bar
    wofi #bemenu
    gtklock # lock screen
    swayidle # idle daemon
    imv # image viewer
    grim slurp # simple screenshot
    flameshot ksnip sway-contrib.grimshot
    swww # wallpaper daemon
    mako libnotify # notification daemon
    wlogout
    mpvpaper
    pass-wayland # password manager

    # CUSTOMIZATION - WAYLAND - NOT USED
    #nwg-bar
    #nwg-menu
    #nwg-panel
    #nwg-drawer
    #nwg-wrapper
    #nwg-launchers
    #waybar
    #swaylock-effects
  ];

}
