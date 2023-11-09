{ config, pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit
      (pkgs.luajitPackages) 
      lsp-zero-nvim
      lua-lsp # LSP for lua.
      ;
      (pkgs.vimPlugins)
      lsp-zero-nvim
      coc-sumneko-lua;
      (pkgs) gopls;
  };

}
