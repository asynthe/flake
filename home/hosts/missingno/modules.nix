{
    imports = [
        
        ../../modules/home/pkgs_minimal.nix
        ../../modules/home/fonts.nix

        # Apps
	../../modules/home/app/alacritty.nix
        ../../modules/home/app/android.nix # adb + waydroid.
        #../../modules/home/app/bash.nix # bash shell.
	../../modules/home/app/bat.nix
	#../../modules/home/app/emacs.nix
	../../modules/home/app/eza.nix
        ../../modules/home/app/git.nix
        ../../modules/home/app/gpg.nix
        ../../modules/home/app/lf.nix
        #../../modules/home/app/mako.nix
	#../../modules/home/app/mpd.nix
	../../modules/home/app/mpv.nix
	#../../modules/home/app/obs.nix
	#../../modules/home/app/social.nix
        ../../modules/home/app/ssh.nix
        ../../modules/home/app/starship.nix
        ../../modules/home/app/tmux.nix
        #../../modules/home/app/wofi.nix
        ../../modules/home/app/yazi.nix
        ../../modules/home/app/zathura.nix
        ../../modules/home/app/zoxide.nix
        ../../modules/home/app/zsh.nix

        # Dev
        ../../modules/home/dev/ai.nix
        #../../modules/home/dev/assembly.nix
        ../../modules/home/dev/latex.nix
        #../../modules/home/dev/python.nix # Managed by kali's apt for now.

        # System
        ../../modules/home/sys/nix_settings.nix
    ];
}
