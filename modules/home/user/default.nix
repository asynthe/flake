{config, ...}: {
  imports = [
    ./coreutils_replace.nix
    ./fonts.nix
    ./gtk.nix
    ./pkgs.nix
    ./shell.nix
    ./xdg.nix
  ];
}
