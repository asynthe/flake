{ pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      lua
      luajit
      ;
      (pkgs.luajitPackages) luarocks-nix;
  };

}
