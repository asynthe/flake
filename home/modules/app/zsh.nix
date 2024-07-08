{ config, pkgs, inputs, user, ... }: {

    programs.zsh = {
        enable = true;
	    defaultKeymap = "viins"; # `emacs`, `vicmd`, `viins`.

	    # No comments...
	    dotDir = ".config/zsh";
        #dotDir = "${user}";
        #dotDir = "/home/${user}/.config/zsh";
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
	        EDITOR = "nvim";
	        FILE = "lf";
            FLAKE = "/home/${user}/sync/yuugen";
    	};

        # Aliases
        shellAliases = {

            # General
	        py = "python3";
            disk = "(df -h | head -n 1; df -h | grep nvme)";
            ga = "git add -A";
            m = "ncmpcpp";
            n = "nvim";
            rm = "rm -i";
            v = "${pkgs.alsa-utils}/bin/alsamixer";
            vv = "${pkgs.pulsemixer}/bin/pulsemixer";

            # Other
	        book = "${pkgs.fd}/bin/fd . ~/sync/archive/book/reading --type f -e 'pdf' -e 'epub' | ${pkgs.skim}/bin/sk | xargs ${pkgs.zathura}/bin/zathura";

	        # Tools
	        bt = "${pkgs.bluetuith}/bin/bluetuith";
	        yt = "${pkgs.yt-dlp}/bin/yt-dlp -f  'bv[ext=mp4]+ba[ext=m4a]' --merge-output-format mp4";
	        yt-mp3 = "${pkgs.yt-dlp}/bin/yt-dlp -f 'ba' -x --audio-format mp3";

            # Wallpaper
	        wall = "${pkgs.fd}/bin/fd . ${config.home.homeDirectory}/sync/archive/wallpaper/img -e jpg -e png | ${pkgs.skim}/bin/sk | xargs ${inputs.swww.packages.${pkgs.system}.swww}/bin/swww img";
	        wallp = "${pkgs.fd}/bin/fd . ${config.home.homeDirectory}/sync/archive/wallpaper/img -e jpg -e png | ${pkgs.skim}/bin/sk | tee >(xargs ${inputs.swww.packages.${pkgs.system}.swww}/bin/swww img) >(xargs ${pkgs.wallust}/bin/wallust run)"; 

	        # Random
	        rickroll = "${pkgs.curl}/bin/curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master.roll.sh | ${pkgs.bash}/bin/bash";

	        # Nix
	        #update = "nix flake update '${config.home.homeDirectory}/yuugen' && home-manager switch --flake '${config.home.homeDirectory}/yuugen#ben' && sudo nixos-rebuild switch --flake '${config.home.homeDirectory}/yuugen#thinkpad'";
	        #upgrade = "sudo nixos-rebuild switch --flake ${config.xdg.configHome}/yuugen#thinkpad"; 
	        #upgrade-home = "home-manager switch --flake ${config.xdg.configHome}/yuugen#ben"; 
	        #gc = "sudo nix-collect-garbage -d";
	        #gc-home = "nix-env --delete-generations 7d && nix-store --gc";
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

# ZSH options (setopt)
while read -r option; do
    setopt $option
done <<-EOF
APPEND_HISTORY
HIST_IGNORE_DUPS
HIST_IGNORE_SPACE
INC_APPEND_HISTORY
INTERACTIVE_COMMENTS
NO_BEEP
EOF

# zsh-vi-mode configuration
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

    # App integrations.
    programs = {
        fzf.enableZshIntegration = config.programs.zsh.enable;
        skim.enableZshIntegration = config.programs.zsh.enable;
        broot.enableZshIntegration = config.programs.zsh.enable;
        direnv.enableZshIntegration = config.programs.zsh.enable;
        #pyenv.enableZshIntegration = config.programs.zsh.enable;
    };
}
