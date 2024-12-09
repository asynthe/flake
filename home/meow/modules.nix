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

        # testing - not yet
        ../../dots/rofi
	    ../../dots/mpd
        ../../dots/mpv
        ../../dots/nushell

        # mkOutOfStoreSymlink
	    ../../dots/ncmpcpp
        ../../dots/direnv
        ../../dots/emacs
        ../../dots/hypr # Hyprland
        ../../dots/nvim # Using nixvim so I'll leave it like that.
        ../../dots/starship
        ../../dots/tmux
        ../../dots/vis
        ../../dots/waybar
        ../../dots/wayfire
        ../../dots/wezterm
        ../../dots/wofi
        ../../dots/zathura

        # Non-existent config file but appends to something 
	    ../../dots/bat
	    ../../dots/mpvpaper
        ../../dots/eza
        ../../dots/nh
        ../../dots/zoxide
	    ../../dots/swww # FIX

        # Stylix modified
	    ../../dots/alacritty
        ../../dots/yazi

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
	    ../../dots/home/app/vscode

	    # FIND PROBLEM with sql rust thing !!!
        # Apps - Single Files
        ../../dots/home/app/fbterm.nix
        ../../dots/home/app/git.nix
	    ../../dots/home/app/mako.nix
        ../../dots/home/app/swappy.nix
        #../../dots/home/app/swayidle.nix
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
        ../../dots/home/shell/zsh.nix
        
        # systemd services + timers
        ../../dots/home/sysd/backup_web.nix
    ];
}
