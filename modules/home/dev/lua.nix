{ pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      #lua
      luajit
      ;
    inherit (pkgs.luajitPackages)
    luarocks-nix
    luafilesystem
    #luarocks
    ;
  };

}
