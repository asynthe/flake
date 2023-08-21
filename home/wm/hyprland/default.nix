{ pkgs, inputs, ... }: {

  wayland.windowManager.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    xwayland = {
      enable = true;
      hidpi = true;
    };
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    #settings = ;
  };

  home.packages = with pkgs; [

    # Hyprland related
    hyprland-protocols
    hyprland-share-picker
    xdg-desktop-portal-hyprland

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
