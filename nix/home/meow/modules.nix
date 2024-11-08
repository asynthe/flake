{
    imports = [

        # Substituters and Binary Cache
        # -------------------------------------------------
        # Remember to first rebuild home manager with 
        # the specified cache then enable the dotfile .
        ../modules/sys/substituters.nix
        # - Hyprland
        # - Wezterm
        # - Yazi

        # mkOutOfStoreSymlink
        ../../../dots/emacs
        ../../../dots/waybar
        #../../../dots/wezterm

        # wm
        ../../../dots/wayfire
        ../../../dots/hypr # Hyprland

        # non-mkOutOfStoreSymlink (modified by stylix)
	    ../../../dots/alacritty

        # testing
        ../../../dots/mpv
        ../../../dots/starship
        ../../../dots/tmux
        ../../../dots/vis
        ../../../dots/yazi
        ../../../dots/zathura

        # -------------- Other [REMOVE] --------------
        # Check yazi vs lf, maybe with a mkForce
        # Test - REMOVE LATER
        #../../secrets/secrets_home.nix
        #../modules/pkgs/pkgs_test.nix
        #../modules/pkgs/sec2.nix
	    # Game -> Moved to option
        #../modules/game/emulators.nix
        #../modules/game/games.nix
        #../modules/game/tools.nix
        # --------------------------------------------

        # Package Set
        ../modules/pkgs/audio.nix
        ../modules/pkgs/cli.nix
        ../modules/pkgs/gui.nix
        ../modules/pkgs/minimal.nix
        #../modules/pkgs/sec.nix
        ../modules/pkgs/pkgs.nix

	    # Apps
        ../modules/app/gpg
	    #../modules/app/lf
	    ../modules/app/librewolf
	    ../modules/app/mpd
	    ../modules/app/ncmpcpp
	    ../modules/app/nvim
	    ../modules/app/swww
	    ../modules/app/vscode

	    # FIND PROBLEM with sql rust thing !!!
        # Apps - Single Files
	    ../modules/app/bat.nix
	    ../modules/app/direnv.nix
        ../modules/app/fbterm.nix
        ../modules/app/git.nix
	    ../modules/app/mako.nix
	    ../modules/app/mpvpaper.nix
        ../modules/app/nh.nix
	    ../modules/app/obs.nix
        #../modules/app/spotifyd.nix
        ../modules/app/swappy.nix
        ../modules/app/swayidle.nix
        #../modules/app/swayosd.nix
        ../modules/app/wofi.nix

	    # System
        ../modules/sys/fonts.nix
        ../modules/sys/jp.nix
        ../modules/sys/settings.nix
        ../modules/sys/stylix.nix
        ../modules/sys/xdg.nix

        # Shell
        ../modules/shell/aliases.nix
        ../modules/shell/bash.nix
        ../modules/shell/eza.nix
        ../modules/shell/plugins.nix
        ../modules/shell/zoxide.nix
        ../modules/shell/zsh.nix
        
        # systemd services + timers
        ../modules/sysd/backup_web.nix
    ];
}
