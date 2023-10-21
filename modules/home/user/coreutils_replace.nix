{
  config,
  pkgs,
  ...
}: {
  # Replace coreutils with uutils.
  # https://discourse.nixos.org/t/how-to-use-uutils-coreutils-instead-of-the-builtin-coreutils/8904/4
  home.packages = [
    (pkgs.uutils-coreutils.override {prefix = "";})
  ];
}
