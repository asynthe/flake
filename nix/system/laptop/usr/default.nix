{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./env.nix
    ./fonts.nix
    ./pkgs.nix
    ./user.nix
  ];
}
