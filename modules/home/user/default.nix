{config, ...}: {
  imports = [
    ./coreutils_replace.nix
    ./gtk.nix
    ./xdg.nix
  ];
}
