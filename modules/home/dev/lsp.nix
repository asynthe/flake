{ config, pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit
      (pkgs) gopls;
      (pkgs.luajitPackages) lua-lsp;
      #(pkgs.vimPlugins) lsp-zero-nvim coc-sumneko-lua;
  };

}
