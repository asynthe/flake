{config, ...}: {
  imports = [
    ./coreutils_replace.nix
    ./fonts.nix
    ./gtk.nix
    ./xdg.nix
  ];
}
