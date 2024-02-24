{ config, pkgs, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)

            # Shell
            direnv
            eza
            starship
            ueberzugpp
            fd ripgrep
            fzf skim
            zoxide

            # Tools
	    yt-dlp
            ncdu

            # Tools - GUI
            mpv
            zathura

            # Tools - Compressing
            zip
            unar

            # Bluetooth
            bluez
            bluez-tools
            bluetuith

            # Fun
            unimatrix
            pipes-rs
            cava cli-visualizer
        ;
    };
}
