{ config, pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit (pkgs) gopls;
    inherit (pkgs.luajitPackages) lua-lsp;
    inherit (pkgs.vimPlugins) lsp-zero-nvim; #coc-sumneko-lua;
  };

}
