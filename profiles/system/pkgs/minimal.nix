{ config, lib, pkgs, ... }:
with lib; with types;
let
    cfg = config.meta.system;
in {
    config = mkIf (cfg.packages == "minimal") {
        environment.systemPackages = builtins.attrValues {
            inherit (pkgs)
	            fzf skim
	            lf
                alacritty kitty # Always good to have some extra terminals.
                cachix
                gptfdisk
                git # Git must be installed before flakes.
                htop btop
                killall
                ncdu
                neovim tmux
                testdisk testdisk-qt
                tree
                usbutils
                wget curl
                ntfs3g # Windows Support
            ;
        };
    };
}
