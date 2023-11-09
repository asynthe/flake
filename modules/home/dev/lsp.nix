{ config, pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit (pkgs) 
    gopls
    lua-language-server # lua_ls
    ;
    inherit (pkgs.luajitPackages) lua-lsp;
    inherit (pkgs.vimPlugins) lsp-zero-nvim; #coc-sumneko-lua;
    inherit (pkgs.python311Packages) jedi python-lsp-server;
  };

}
