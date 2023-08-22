{ config, pkgs-darwin, ... }:
{

  imports = [
    ./pkgs.nix
    ./shell.nix # ZSH configuration
    ./sys.nix # System configuration
    #../../wm/yabai # Yabai configuration
  ];

}
