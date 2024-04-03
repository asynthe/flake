{
    imports = [

        ../modules/pkgs.nix
        ../modules/fonts.nix
	../modules/sec/pkgs.nix
	#../modules/sec/home-security-box.nix
                
        # Apps
	../modules/app/alacritty.nix
        ../modules/app/android.nix # adb + waydroid.
        #../modules/app/bash.nix # bash shell.
	../modules/app/bat.nix
	../modules/app/direnv.nix
        #../modules/app/emacs.nix
        ../modules/app/eza.nix
        ../modules/app/git.nix
        ../modules/app/gpg.nix
        ../modules/app/lf.nix
        ../modules/app/mako.nix
        #../modules/app/mpd.nix
	../modules/app/mpv.nix
	../modules/app/obs.nix
        ../modules/app/social.nix # Discord, IRC, Signal, Telegram.
        #../modules/app/ssh.nix
        ../modules/app/starship.nix
        ../modules/app/tmux.nix
        ../modules/app/vscode.nix
        ../modules/app/wayfire.nix
        ../modules/app/wayland.nix
        ../modules/app/wofi.nix
        ../modules/app/yazi.nix
        ../modules/app/zathura.nix
        ../modules/app/zoxide.nix
        ../modules/app/zsh.nix

	# Game
        #../modules/game/emulators.nix
        ../modules/game/games.nix
        #../modules/game/tools.nix

	# System
        ../modules/sys/nix_settings.nix
        ../modules/sys/gtk.nix
        
        # systemd services + timers
        ../modules/sysd/backup_web.nix
        #../modules/sysd/swww_randomize.nix
    ];
}
