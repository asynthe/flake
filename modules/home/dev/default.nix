{pkgs, ...}: {
  imports = [
    ./latex.nix
    ./python.nix
    ./rust.nix
  ];
}
