{
    imports = [

        ../../secrets/secrets_home.nix

        ../modules/pkgs.nix
        ../modules/pkgs_minimal.nix # No GUI.
	    ../modules/pkgs_sec.nix
        ../modules/pkgs_temp.nix

	    # Apps
	    ../modules/app/hyprland
	    ../modules/app/mpd
	    ../modules/app/ncmpcpp
	    ../modules/app/nvim
                
        # Apps - Single Files
	    ../modules/app/alacritty.nix
        #../modules/app/bash.nix # bash shell.
	    ../modules/app/bat.nix
	    ../modules/app/direnv.nix
        #../modules/app/emacs.nix
        ../modules/app/eza.nix
        #../modules/app/fbterm.nix
        ../modules/app/git.nix
        #../modules/app/gpg.nix
        ../modules/app/lf.nix
        ../modules/app/mako.nix
	    ../modules/app/mpv.nix
	    ../modules/app/obs.nix
	    ../modules/app/pass.nix
        ../modules/app/social.nix # Discord, IRC, Signal, Telegram.
        ../modules/app/spotifyd.nix
        ../modules/app/starship.nix
        #../modules/app/swayidle.nix
        #../modules/app/swayosd.nix
        ../modules/app/tmux.nix
        ../modules/app/vis.nix
        #../modules/app/vscode.nix
        ../modules/app/wayfire.nix
        ../modules/app/wayland.nix
        ../modules/app/wofi.nix
        ../modules/app/yazi.nix
        ../modules/app/zathura.nix
        ../modules/app/zoxide.nix
        ../modules/app/zsh.nix

	    # Game
        #../modules/game/emulators.nix
        #../modules/game/games.nix
        #../modules/game/tools.nix

	    # System
        ../modules/sys/ime.nix
        ../modules/sys/settings.nix
        ../modules/sys/stylix.nix
        #../modules/sys/uutils-replace.nix
        ../modules/sys/var.nix
        
        # systemd services + timers
        ../modules/sysd/backup_web.nix
        #../modules/sysd/swww_randomize.nix
    ];
}
