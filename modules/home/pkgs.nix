{ config, pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit (pkgs)
    direnv
    eza
    starship
    ueberzugpp
    fd ripgrep
    fzf skim
    zoxide
    unimatrix
    pipes-rs
    cava cli-visualizer
    acpi
    zathura

    bluez
    bluez-tools
    bluetuith
    mpv
    ;
  };
}
