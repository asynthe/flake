{ pkgs-stable, ... }: {

    environment.systemPackages = builtins.attrValues {
        inherit (pkgs-stable)
	        fzf skim
	        lf
	        ncdu
            htop btop
            alacritty kitty # Always good to have some extra terminals.
            cachix
            git # Git must be installed before flakes.
            neovim tmux
            wget curl
        ;
    };
}
