{ config, pkgs, ... }: {

    environment.systemPackages = builtins.attrValues {
        inherit (pkgs)
            alacritty kitty # Always good to have some extra terminals.
            wget curl
            git # Git must be installed before flakes.
            cachix
            tmux
            neovim
        ;
    };
}
