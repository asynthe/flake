{ config, pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit
      (pkgs) gopls;
      #(pkgs.luajitPackages) lsp-zero-nvim lua-lsp;
      #(pkgs.vimPlugins) lsp-zero-nvim coc-sumneko-lua;
  };

}
