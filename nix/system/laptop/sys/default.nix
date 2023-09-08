{config, ...}: {
  imports = [
    ./audio.nix
    ./boot.nix
    ./fs.nix
    ./kernel.nix
    ./network.nix
    ./nix_settings.nix
    ./win_mount.nix
  ];
}
