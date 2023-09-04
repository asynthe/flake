{config, ...}: {
  imports = [
    ./android.nix
    ./mpd.nix
    ./vm.nix
    ./wine.nix
  ];
}
