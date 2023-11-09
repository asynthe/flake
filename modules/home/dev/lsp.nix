{ config, pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit (pkgs) gopls;
    inherit (pkgs.luajitPackages) lua-lsp;
    inherit (pkgs.vimPlugins) lsp-zero-nvim; #coc-sumneko-lua;
    inherit (pkgs.python311Packages) jedi python-lsp-server;
  };

}
