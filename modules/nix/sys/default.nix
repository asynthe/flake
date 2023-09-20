{config, ...}: {
  imports = [
    ./boot.nix
    ./fs.nix
    ./network.nix
    ./nix_settings.nix
    ./win_mount.nix
  ];
}
