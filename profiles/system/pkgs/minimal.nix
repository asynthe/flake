{ config, lib, pkgs, ... }:
with lib; with types;
let
    cfg = config.meta.system;
in {
    config = mkIf (cfg.packages == "minimal") {
        environment.systemPackages = builtins.attrValues {
            inherit (pkgs)
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
    };
}
