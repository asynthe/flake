{ config, pkgs, username, ... }: {

    programs.zsh = {
        enable = true;
	defaultKeymap = "viins"; # `emacs`, `vicmd`, `viins`.

	# No comments...
	dotDir = ".config/zsh";
	#dotDir = "${username}";
	#dotDir = "/home/${username}/.config/zsh";
	#dotDir = "${config.xdg.configHome}/zsh";

	# Configuration
	autocd = true;
	history = {
	    size = 10000;
	    path = "${config.xdg.configHome}/zsh/zsh_history";
	};

	# Variables
	sessionVariables = {

	    #TERM="xterm-256color"; # ?
	    BROWSER="firefox";
	    READER="zathura";
	    FILE="lf";
	    EDITOR="nvim";

	    #GNUPGHOME="/home/${username}/sync/pass/gpg"; # SECRET
	    #PASSWORD_STORE_DIR="/home/${username}/sync/pass/pass" # SECRET
	    #STARSHIP_CONFIG="/home/${username}/.config/starship/starship.toml"
	    #WAYFIRE_CONFIG_FILE="/home/${username}/.config/wayfire/wayfire.ini" # -> wayfire.nix

	};

	initExtra = ''
	  # Run after 5 minutes of inactivity.
	  TMOUT=300;
          TRAPALRM() { ${pkgs.pipes-rs}/bin/pipes-rs }
          #TRAPALRM() { unimatrix -s 93 }
	'';

        # Aliases
        shellAliases = {
	
	    sl = "${pkgs.eza}/bin/eza --icons --group-directories-first";
	    ls = "${pkgs.eza}/bin/eza --icons --group-directories-first";
	    la = "${pkgs.eza}/bin/eza -a --icons --group-directories-first";
	    ll = "${pkgs.eza}/bin/eza --long --group-directories-first";
	    lla = "${pkgs.eza}/bin/eza -a --long --group-directories-first";
	    lg = "${pkgs.eza}/bin/eza --long --git --group-directories-first";

	    ssh = "ssh -i /home/${username}/sync/pass/ssh/wsl/wsl"; # SECRET
	    py = "python3";
	    pdf = "zathura";

	    # Tools
	    bt = "${pkgs.bluetuith}/bin/bluetuith";
	    yt = "${pkgs.yt-dlp}/bin/yt-dlp -f  'bv[ext=mp4]+ba[ext=m4a]' --merge-output-format mp4";
	    yt-mp3 = "${pkgs.yt-dlp}/bin/yt-dlp -f 'ba' -x --audio-format mp3";

	    # move to wm/hyprland.nix
	    wall = "${pkgs.fd}/bin/fd . ${config.xdg.configHome}/sync/archive/wallpaper/img -e jpg -e png | ${pkgs.skim}/bin/sk | xargs ${pkgs.swww}/bin/swww img";
	    wallp = "${pkgs.fd}/bin/fd . ${config.xdg.configHome}/sync/archive/wallpaper/img -e jpg -e png | ${pkgs.skim}/bin/sk | tee >(${pkgs.pywal}/bin/wal -i) >(xargs ${pkgs.swww}/bin/swww img)";
	    video = "${pkgs.fd}/bin/fd . ${config.xdg.configHome}/sync/archive/wallpaper/video -e mp4 | ${pkgs.skim}/bin/sk | xargs ${pkgs.mpvpaper}/bin/mpvpaper -v -p -o 'loop-file=inf' '*'";

	    # Learning and entertainment
	    book = "${pkgs.fd}/bin/fd . ~/sync/archive/book --type f -e 'pdf' -e 'epub' | ${pkgs.skim}/bin/sk | xargs zathura";
	    rickroll = "${pkgs.curl}/bin/curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master.roll.sh | ${pkgs.bash}/bin/bash";
	    tv-jp = "${pkgs.mpv}/bin/mpv https://iptv-org.github.io/iptv/countries/jp.m3u";
	    tv-cl = "${pkgs.mpv}/bin/mpv https://iptv-org.github.io/iptv/countries/jp.m3u";

	    # Nix
	    update = "nix flake update ${config.xdg.configHome}/yuugen";
	    #upgrade = "sudo nixos-rebuild switch --flake ${config.xdg.configHome}/yuugen#thinkpad"; 
	    #upgrade-home = "home-manager switch --flake ${config.xdg.configHome}/yuugen#ben"; 
	    upgrade-wsl = "home-manager switch --flake ${config.xdg.configHome}/yuugen#missingno";
	    gc = "sudo nix-collect-garbage -d";
	    gc-home = "nix-env --delete-generations 7d && nix-store --gc";
        };

	# Plugins
	autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
	#plugins.<> = {
	    #name = ;
	    #file = ;
	    #src = ;
	#};
    };

    programs = {
        broot.enableZshIntegration = config.programs.zsh.enable;
        direnv.enableZshIntegration = config.programs.zsh.enable;
        eza.enableZshIntegration = config.programs.zsh.enable;
        fzf.enableZshIntegration = config.programs.zsh.enable;
	skim.enableZshIntegration = config.programs.zsh.enable;
        #pyenv.enableZshIntegration = config.programs.zsh.enable;
	zoxide.enableZshIntegration = config.programs.zsh.enable;
    };
}
