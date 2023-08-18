{ config, pkgs, ... }: 

{

  imports = [
  ./android.nix
  #./docker.nix
  #./mesh_network.nix
  #./monero.nix
  ./syncthing.nix
  ];
 
}
