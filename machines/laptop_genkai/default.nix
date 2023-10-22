{ config, pkgs, ... }: {

  imports = [

    # Core server configuration + My own configuration.
    ../basic
    ../../modules/nix/genkai.nix

    # WMs
    ../../modules/nix/wm/hyprland.nix
    #../../modules/nix/wm/xmonad.nix
  ];

}
