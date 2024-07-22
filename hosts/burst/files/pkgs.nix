{ pkgs-stable, ... }: {
    environment.systemPackages = builtins.attrValues {
        inherit (pkgs-stable)
            usbutils
	        fzf skim
	        lf
	        ncdu
            alacritty kitty # Always good to have some extra terminals.
            cachix
            git # Git must be installed before flakes.
            htop btop
            neovim tmux
            ntfs3g
            testdisk testdisk-qt
            wget curl
            killall
            tree
        ;
    };
}
