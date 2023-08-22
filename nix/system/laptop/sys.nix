{ config, pkgs, lib, username, hostname, ... }:
{

  nix = {
    # Garbage collection
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
      };

    # Nix settings
    settings = {
      auto-optimise-store = true;
      trusted-users = [ "${username}" ];
      system-features = [ "recursive.nix" ];
      experimental-features = [ "nix-command" "flakes" "recursive-nix" ];
      warn-dirty = false;

      substituters = [
        "https://cache.nixos.org/" # The main cache, you can replace w one closer to you.
        "https://hyprland.cachix.org"
        "https://nix-community.cachix.org" # Nix community's cache server
        "https://nixpkgs-wayland.cachix.org"
      ];

      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" # Hyprland
        "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E=" # Cuda Maintaners, nvidia
      ];

    };
  };

  system = {
    autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
    stateVersion = "22.11";
    #copySystemConfiguration = true; # Not supported by flakes.
  };

  boot.binfmt.emulatedSystems = [ "aarch64-linux" "riscv64-linux" ];
  boot.supportedFilesystems = [
    "ext4"
    "btrfs"
    "xfs"
    "zfs"
    "ntfs"
    "fat"
    "vfat"
    "exfat"
    "cifs" # mount windows share
  ];

}
