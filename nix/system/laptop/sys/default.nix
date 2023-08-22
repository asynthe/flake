{ config, pkgs, ... }:

{

  imports = [
  #./bluetooth.nix
  #./boot_grub.nix
  ./fcitx5.nix
  ./networking.nix
  ./nvidia_drivers.nix
  ./pkgs.nix
  ./sound.nix
  ./vm.nix
  ./windows_mount.nix
  ./zfs.nix
  ];

}
