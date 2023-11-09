{ config, pkgs, ... }: {

  home.packages = builtins.attrValues {

    inherit (pkgs.vimPlugins) lsp-zero-nvim; # lsp-zero

    # Lua
    lua-language-server # lua_ls
    stylua
    ;
    inherit (pkgs.luajitPackages) lua-lsp luacheck;

    # Python
    inherit (pkgs.python311Packages) jedi python-lsp-server;

    # Rust

    # Go
    inherit (pkgs) gopls;

  };

}
