{ config, ... }: {

    imports = [
        ../../modules/home/pkgs_ben.nix
        ../../modules/home/fonts.nix
                
        # Apps
	../../modules/home/app/alacritty.nix
        ../../modules/home/app/android.nix # adb + waydroid.
        #../../modules/home/app/bash.nix # bash shell.
        #../../modules/home/app/emacs.nix
        ../../modules/home/app/eza.nix
        ../../modules/home/app/git.nix
        ../../modules/home/app/gpg.nix
        ../../modules/home/app/lf.nix
        ../../modules/home/app/mako.nix
        #../../modules/home/app/mpd.nix
	../../modules/home/app/mpv.nix
	../../modules/home/app/obs.nix
        ../../modules/home/app/social.nix # Discord, IRC, Signal, Telegram.
        ../../modules/home/app/ssh.nix
        ../../modules/home/app/starship.nix
        ../../modules/home/app/tmux.nix
        ../../modules/home/app/wofi.nix
        #../../modules/home/app/yazi.nix
        ../../modules/home/app/zathura.nix
        ../../modules/home/app/zoxide.nix
        ../../modules/home/app/zsh.nix

        # Dev
        ../../modules/home/dev/ai.nix
        #../../modules/home/dev/assembly.nix
        ../../modules/home/dev/python.nix
        ../../modules/home/dev/latex.nix

	# Game
        #../../modules/home/game/emulators.nix
        ../../modules/home/game/games.nix
        #../../modules/home/game/tools.nix

	# System
        ../../modules/home/sys/nix_settings.nix
        ../../modules/home/sys/gtk.nix
        
        # systemd services + timers
        ../../modules/home/sysd/backup_bookmarks.nix
    ];
}
