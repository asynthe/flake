{ config, pkgs, ... }: {

  imports = [

    ../../modules/darwin/pkgs.nix # Packages
    ../../modules/darwin/shell.nix # ZSH and terminal configuration
    #../../yabai.nix # Yabai configuration (implement later)

  ];

}
