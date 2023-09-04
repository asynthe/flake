{ pkgs, inputs, ... }: {

  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;

  wayland.windowManager.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    xwayland.enable = true;
    #package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    #settings = ;
  };

  # Session variables for Hyprland
  home.sessionVariables.NIXOS_OZONE_WL = "1";

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

    # Testing to implement
    waybar
    # Not used
    #nwg-bar
    #nwg-menu
    #nwg-panel
    #nwg-drawer
    #nwg-wrapper
    #nwg-launchers
    #swaylock-effects
  ];

}
