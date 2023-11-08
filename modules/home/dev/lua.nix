{ pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit
      (pkgs.luajitPackages)
      lua
      luajit
      luarocks-nix
      ;
  };

}
