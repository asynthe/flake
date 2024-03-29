{ config, lib, pkgs, ... }:

with lib;

let

    cfg_ben = config.home.configuration.ben;
    cfg_missingno = config.home.configuration.missingno;

in {

    options.home.configuration = {

        ben.enable = mkOption {
            type = types.bool;
	    default = false;
	    description = "Home manager configuration for linux.";
        };

	missingno.enable = mkOption {
            type = types.bool;
	    default = false;
	    description = "Home manager configuration for wsl.";
        };
    };

    config = mkMerge [
        (mkIf (cfg_ben.enable) {

	    imports = [
                ../modules/home/pkgs_ben.nix
                ../modules/home/fonts.nix
                
                # Apps
                ../modules/home/app/android.nix # adb + waydroid.
                #../modules/home/app/bash.nix # bash shell.
                #../modules/home/app/emacs.nix
                ../modules/home/app/git.nix
                ../modules/home/app/gpg.nix
                ../modules/home/app/lf.nix
                ../modules/home/app/mpd.nix
                ../modules/home/app/social.nix # Discord, IRC, Signal, Telegram.
                ../modules/home/app/ssh.nix
                ../modules/home/app/starship.nix
                ../modules/home/app/tmux.nix
                #../modules/home/app/yazi.nix
                ../modules/home/app/zathura.nix
                ../modules/home/app/zsh.nix

                # Dev
                ../modules/home/dev/ai.nix
                #../modules/home/dev/assembly.nix
                ../modules/home/dev/python.nix
                ../modules/home/dev/latex.nix

		# Game
                #../modules/home/game/emulators.nix
                ../modules/home/game/games.nix
                #../modules/home/game/tools.nix

		# System
                ../modules/home/sys/nix_settings.nix
                ../modules/home/sys/gtk.nix
                
                # systemd services + timers
                ../modules/home/sysd/backup_bookmarks.nix
	    ];

	})

	(mkIf (cfg_missingno.enable) {

	    imports = [
                ../modules/home/pkgs.nix
                ../modules/home/fonts.nix

                # Apps
                ../modules/home/app/android.nix # adb + waydroid.
                #../modules/home/app/bash.nix # bash shell.
                ../modules/home/app/git.nix
                ../modules/home/app/gpg.nix
                ../modules/home/app/lf.nix
                ../modules/home/app/ssh.nix
                ../modules/home/app/starship.nix
                ../modules/home/app/tmux.nix
                ../modules/home/app/zathura.nix
                ../modules/home/app/zsh.nix

                # Dev
                ../modules/home/dev/ai.nix
                #../modules/home/dev/assembly.nix
                ../modules/home/dev/python.nix
                ../modules/home/dev/latex.nix
                #../modules/home/dev/python.nix # Managed by kali's apt for now.

                # System
                ../modules/home/sys/nix_settings.nix
	    ];

	})
    ];
}
