{
  config,
  pkgs,
  ...
}: {
  # Replace coreutils with uutils.
  # https://discourse.nixos.org/t/how-to-use-uutils-coreutils-instead-of-the-builtin-coreutils/8904/4
  home.packages = [

    # Cargo from this conflicts with cargo from rustup (dev/rust.nix)
    #(pkgs.uutils-coreutils.override {prefix = "";})
  ];
}
