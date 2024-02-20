{ config, pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit (pkgs)
    direnv
    eza
    starship
    ueberzugpp
    fzf skim
    zoxide
    unimatrix
    pipes-rs
    cava cli-visualizer
    ;
  };
}
