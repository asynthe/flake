{
    imports = [

	# Game -> Moved to option
        #../modules/game/emulators.nix
        #../modules/game/games.nix
        #../modules/game/tools.nix

        ../../secrets/secrets_home.nix

        ../modules/wayland
        #./modules/x11

	# Apps
	../modules/app/lf
	../modules/app/librewolf
	../modules/app/mpd
	../modules/app/ncmpcpp
	../modules/app/nvim
	../modules/app/vscode
	../modules/app/wezterm
        ../modules/app/gpg

        # Single files
	../modules/pkgs/security.nix # Pentesting.
        ../modules/pkgs/minimal.nix # No GUI.
        ../modules/pkgs/pkgs.nix
        ../modules/pkgs/pkgs_audio.nix
        ../modules/pkgs/pkgs_test.nix

        # Apps - CLI
        #../modules/app/bash.nix # bash shell.
	../modules/app/bat.nix
	../modules/app/direnv.nix
        ../modules/app/eza.nix
        #../modules/app/fbterm.nix
        ../modules/app/git.nix
	../modules/app/mpv.nix
        ../modules/app/spotifyd.nix
        ../modules/app/starship.nix
        ../modules/app/tmux.nix
        ../modules/app/vis.nix
        ../modules/app/yazi.nix
        ../modules/app/zoxide.nix
        ../modules/app/zsh.nix

        # Apps - GUI
	../modules/app/alacritty.nix
	../modules/app/obs.nix
        #../modules/app/emacs.nix
        ../modules/app/zathura.nix

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
