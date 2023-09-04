{ pkgs, inputs, lib, username, ... }: 

let

  filePath = ./hyprland.conf;
  fileContent = builtins.readFile filePath;

in {

  wayland.windowManager.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    xwayland.enable = true;
    #package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    #settings = ;
    extraConfig = "${fileContent}";
  };

  home.sessionVariables.NIXOS_OZONE_WL = "1"; # Session variable for Electron apps.
  home.packages = with pkgs; [

    # Hyprland related
    xdg-desktop-portal-hyprland

    # Apps
    wofi #bemenu
    gtklock # lock screen
    swayidle # idle daemon
    imv # image viewer
    grim slurp # simple screenshot
    flameshot ksnip sway-contrib.grimshot
    swww wpaperd # wallpaper daemon
    mako libnotify # notification daemon
    wlogout
    mpvpaper
    pass-wayland # password manager

    # Testing to implement
    waybar
    eww-wayland # remove or change?

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
