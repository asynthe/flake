{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./gaming.nix
    ./syncthing.nix
  ];
}
