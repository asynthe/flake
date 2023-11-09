{ config, pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit
      (pkgs.luajitPackages) lua-lsp; # LSP for lua.
  };

}
