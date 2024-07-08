{
    imports = [

        # Test
        ../../secrets/secrets_home.nix
        ../modules/pkgs/pkgs_test.nix

	    # Game -> Moved to option
        #../modules/game/emulators.nix
        ../modules/game/games.nix
        #../modules/game/tools.nix

        ../modules/wayland
        #./modules/x11

	    # Apps
        ../modules/app/emacs
        ../modules/app/gpg
	    ../modules/app/lf
	    ../modules/app/librewolf
	    ../modules/app/mpd
	    ../modules/app/ncmpcpp
	    ../modules/app/nvim
	    ../modules/app/vscode
	    ../modules/app/wezterm

        # Packages
        ../modules/pkgs/audio.nix
        ../modules/pkgs/cli.nix
        ../modules/pkgs/gui.nix
        ../modules/pkgs/minimal.nix
        ../modules/pkgs/pkgs.nix
        ../modules/pkgs/sec.nix

        # Apps - Single Files
	    ../modules/app/alacritty.nix
	    ../modules/app/bat.nix
	    ../modules/app/direnv.nix
	    ../modules/app/mpv.nix
	    ../modules/app/obs.nix
        #../modules/app/bash.nix # bash shell.
        #../modules/app/fbterm.nix
        ../modules/app/eza.nix
        ../modules/app/git.nix
        ../modules/app/spotifyd.nix
        ../modules/app/starship.nix
        ../modules/app/tmux.nix
        ../modules/app/vis.nix
        ../modules/app/yazi.nix
        ../modules/app/zathura.nix
        ../modules/app/zoxide.nix
        ../modules/app/zsh.nix

	    # System
        ../modules/sys/fonts.nix
        ../modules/sys/ime.nix
        ../modules/sys/settings.nix
        ../modules/sys/stylix.nix
        #../modules/sys/uutils-replace.nix
        ../modules/sys/var.nix
        #../modules/sys/xdg.nix
        
        # systemd services + timers
        ../modules/sysd/backup_web.nix
    ];
}
