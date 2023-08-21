{ config, pkgs, ... }:

{

  imports = [
  ./shell.nix
  ./tty.nix
  ./user.nix
  ];

}
