{ config, lib, pkgs-stable, ... }:
with lib; with types;
let
    cfg = config.meta.system;
in {
    config = mkIf (cfg.packages == "minimal_stable") {
        environment.systemPackages = builtins.attrValues {
            inherit (pkgs-stable)
                acpi
                usbutils
	            fzf skim
	            lf
	            ncdu
                alacritty kitty # Always good to have some extra terminals.
                cachix
                git # Git must be for flakes.
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
