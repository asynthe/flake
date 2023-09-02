{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./gaming.nix
    ./mpd.nix
    ./syncthing.nix
  ];
}
