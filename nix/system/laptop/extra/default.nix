{ config, pkgs, ... }:

{

  imports = [
  #./clamav.nix
  ./flatpak.nix
  ./gaming.nix
  ./gpg.nix
  ./i2p.nix
  ./locate.nix
  ./mpd.nix
  #./printing.nix
  ./wine.nix
  ];
}
