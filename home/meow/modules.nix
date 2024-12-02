{
    imports = [

        # Substituters and Binary Cache
        # -------------------------------------------------
        # Remember to first rebuild home manager with 
        # the specified cache then enable the dotfile .
        ../../dots/home/sys/substituters.nix
        # - Hyprland
        # - Wezterm
        # - Yazi

        # mkOutOfStoreSymlink
        ../../dots/emacs
        ../../dots/waybar
        ../../dots/wezterm
        ../../dots/wayfire
        ../../dots/hypr # Hyprland

        # testing
	    ../../dots/ncmpcpp
        ../../dots/rofi
        ../../dots/zathura
        ../../dots/direnv

        # testing - not yet
	    ../../dots/mpd
        ../../dots/mpv
        ../../dots/nushell
        ../../dots/starship
        ../../dots/tmux
        ../../dots/vis
        ../../dots/yazi

        # non-existent config file but appends to something 
        ../../dots/eza
	    ../../dots/bat

        # non-mkOutOfStoreSymlink (modified by stylix)
	    ../../dots/alacritty

        # -------------- Remove from here down !!! --------------

        # Package Set
        ../../dots/home/pkgs/audio.nix
        ../../dots/home/pkgs/cli.nix
        ../../dots/home/pkgs/gui.nix
        ../../dots/home/pkgs/minimal.nix
        #../../dots/home/pkgs/sec.nix
        ../../dots/home/pkgs/pkgs.nix

	    # Apps
        ../../dots/home/app/gpg
	    ../../dots/home/app/librewolf
	    ../../dots/home/app/nvim
	    ../../dots/home/app/swww
	    ../../dots/home/app/vscode
	    #../../dots/home/app/lf

	    # FIND PROBLEM with sql rust thing !!!
        # Apps - Single Files
        ../../dots/home/app/fbterm.nix
        ../../dots/home/app/git.nix
	    ../../dots/home/app/mako.nix
	    ../../dots/home/app/mpvpaper.nix
        ../../dots/home/app/nh.nix
	    ../../dots/home/app/obs.nix
        ../../dots/home/app/swappy.nix
        #../../dots/home/app/swayidle.nix
        ../../dots/home/app/wofi.nix
        #../../dots/home/app/swayosd.nix
        #../../dots/home/app/spotifyd.nix

	    # System
        ../../dots/home/sys/fonts.nix
        ../../dots/home/sys/jp.nix
        ../../dots/home/sys/settings.nix
        ../../dots/home/sys/stylix.nix
        ../../dots/home/sys/xdg.nix

        # Shell
        ../../dots/home/shell/aliases.nix
        ../../dots/home/shell/bash.nix
        ../../dots/home/shell/plugins.nix
        ../../dots/home/shell/zoxide.nix
        ../../dots/home/shell/zsh.nix
        
        # systemd services + timers
        ../../dots/home/sysd/backup_web.nix
    ];
}
