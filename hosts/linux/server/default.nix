{ config, pkgs, ... }: {

  imports = [
    ./hardware.nix
    ../modules_list.nix
  ];

  networking.hostName = "server";
  server.networkmanager.enable = true;

  # List of packages I want to have on any computer.
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = builtins.attrValues {
    inherit (pkgs)
      alacritty kitty # Always good to have some extra terminals.
      wget curl
      git # Git must be installed before flakes.
      cachix
      tmux
      firefox
      pavucontrol
      neovim
      libgccjit
      binutils
      ;
  };

}
