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

	    #TERM = "xterm-256color"; # ?
	    BROWSER = "librewolf";
	    EDITOR = "nvim";
	    FILE = "lf";
	    READER = "zathura";

	    #GNUPGHOME = config.sops.secrets."environment/variables/gpg_home".path;
	    #NIX_SSHOPTS = config.sops.secrets."environment/variables/nix_sshopts".path;
	    #PASSWORD_STORE_DIR = config.sops.secrets."environment/variables/pass_dir".path;
	    #SOPS_AGE_KEY_FILE  = config.sops.secrets."environment/variables/sops_age_key".path;

	    #WAYFIRE_CONFIG_FILE = "/home/${username}/.config/wayfire/wayfire.ini" # -> wayfire.nix
	};

        # Aliases
        shellAliases = {

	    ssh = "ssh -i ${config.home.homeDirectory}/sync/pass/ssh/wsl/wsl"; # SECRET
	    py = "python3";
	    pdf = "zathura";

	    # Tools
	    bt = "${pkgs.bluetuith}/bin/bluetuith";
	    yt = "${pkgs.yt-dlp}/bin/yt-dlp -f  'bv[ext=mp4]+ba[ext=m4a]' --merge-output-format mp4";
	    yt-mp3 = "${pkgs.yt-dlp}/bin/yt-dlp -f 'ba' -x --audio-format mp3";

	    wall = "${pkgs.fd}/bin/fd . ${config.home.homeDirectory}/sync/archive/wallpaper/img -e jpg -e png | ${pkgs.skim}/bin/sk | xargs ${pkgs.swww}/bin/swww img";
	    wallp = "${pkgs.fd}/bin/fd . ${config.home.homeDirectory}/sync/archive/wallpaper/img -e jpg -e png | ${pkgs.skim}/bin/sk | tee >(xargs ${pkgs.swww}/bin/swww img) >(xargs ${pkgs.wallust}/bin/wallust run)"; 
	    video = "${pkgs.fd}/bin/fd . ${config.home.homeDirectory}/sync/archive/wallpaper/video -e mp4 | ${pkgs.skim}/bin/sk | xargs ${pkgs.mpvpaper}/bin/mpvpaper -v -p -o 'loop-file=inf' '*'";

	    # Learning and entertainment
	    book = "${pkgs.fd}/bin/fd . ~/sync/archive/book --type f -e 'pdf' -e 'epub' | ${pkgs.skim}/bin/sk | xargs zathura";
	    rickroll = "${pkgs.curl}/bin/curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master.roll.sh | ${pkgs.bash}/bin/bash";
	    tv-jp = "${pkgs.mpv}/bin/mpv https://iptv-org.github.io/iptv/countries/jp.m3u";
	    tv-cl = "${pkgs.mpv}/bin/mpv https://iptv-org.github.io/iptv/countries/jp.m3u";
	    # TEST

	    # Nix
	    update = "nix flake update '${config.home.homeDirectory}/yuugen' && home-manager switch --flake '${config.home.homeDirectory}/yuugen#ben' && sudo nixos-rebuild switch --flake '${config.home.homeDirectory}/yuugen#thinkpad'";
	    #upgrade = "sudo nixos-rebuild switch --flake ${config.xdg.configHome}/yuugen#thinkpad"; 
	    #upgrade-home = "home-manager switch --flake ${config.xdg.configHome}/yuugen#ben"; 
	    upgrade-wsl = "home-manager switch --flake ${config.xdg.configHome}/yuugen#missingno";
	    gc = "sudo nix-collect-garbage -d";
	    gc-home = "nix-env --delete-generations 7d && nix-store --gc";
        };

	# Plugins
	autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
	plugins = [
	    {
	        name = "vi-mode";
	        src = pkgs.zsh-vi-mode;
	        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
	    }
	];

	initExtra = ''
	  # Run after 5 minutes of inactivity.
	  TMOUT=300;
          TRAPALRM() { ${pkgs.pipes-rs}/bin/pipes-rs }
          #TRAPALRM() { unimatrix -s 93 }

	  function zvm_config() {
	  ZVM_CURSOR_STYLE=true

          ZVM_LINE_INIT_MODE=$ZVM_MODE_NORMAL
          #ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT

          ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_UNDERLINE
          ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLINKING_UNDERLINE
	  ZVM_VISUAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
	  ZVM_VISUAL_LINE_MODE_CURSOR=$ZVM_CURSOR_BLOCK
          } 
        '';
    };


    # fzf and skim
    programs.fzf.enableZshIntegration = config.programs.zsh.enable;
    programs.skim.enableZshIntegration = config.programs.zsh.enable;

    # Other
    programs = {
        broot.enableZshIntegration = config.programs.zsh.enable;
        direnv.enableZshIntegration = config.programs.zsh.enable;
        #pyenv.enableZshIntegration = config.programs.zsh.enable;
    };
}
