{ config, pkgs, ... }: {

  home.packages = builtins.attrValues {

    # lsp-zero
    inherit (pkgs.vimPlugins) lsp-zero-nvim;

    # General purpose Language Server
    efm-langserver

    # Lua
    inherit (pkgs)
    lua-language-server # lua_ls (LSP)
    stylua # Lua formatter
    ;
    inherit (pkgs.luajitPackages) lua-lsp luacheck; # Lua linter

    # Python
    inherit (pkgs.python311Packages) jedi python-lsp-server;

    # Rust

    # Go
    inherit (pkgs) gopls;

  };

}
