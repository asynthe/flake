{ config, inputs, lib, pkgs, ... }: {

    #nix.settings = {
        #substituters = "https://yazi.cachix.org";
        #trusted-public-keys = [  "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k=" ];
    #};

    programs.zsh = lib.mkIf config.programs.zsh.enable {
        initExtra = ''
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
        '';
        shellAliases = {
            lf = "yy";
            f = "yy";
            yazi = "yy";
        };
    };

    programs.yazi = {
        enable = true;
        package = inputs.yazi.packages.${pkgs.system}.default;
	    enableBashIntegration = config.programs.bash.enable;
	    enableZshIntegration = config.programs.zsh.enable;
	    settings = {
	        manager = {
                layout = [1 3 4];
                sort_by = "alphabetical";
                sort_dir_first = true;
                sort_sensitive = true;
                sort_reverse = false;
                linemode = "none";
                show_hidden = false;
                show_symlink = false;
	        };
	        preview = {
                tab_size = 2;
                max_width = 600;
                max_height = 900;
		        cache_dir = "/home/${config.home.username}/.cache";
                #cache_dir = "${config.xdg.cacheHome}";
	        };
	    };
    };

    home.packages = builtins.attrValues {
        inherit (pkgs)
	    fd
	    ffmpegthumbnailer
	    file
	    fzf
	    jq
	    poppler
	    ripgrep
	    unar
	    wl-clipboard
	    zoxide
        exiftool
	    ;
    };
}
