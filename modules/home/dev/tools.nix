{ pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit (pkgs)
      vscodium #vscodium-fhs
      #vscode
      #vscode-with-extensions
      ;
  };
}
