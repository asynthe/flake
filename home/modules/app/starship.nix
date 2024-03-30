{ config, pkgs, ... }: {

    programs.zsh.initExtra = ''
      eval "$(starship init zsh)"
    '';

    programs.starship = {
        enable = config.programs.zsh.enable;
	enableZshIntegration = config.programs.zsh.enable;
	settings = {

	    # Get editor completions based on the config schem
	    #"$schema" = 'https://starship.rs/config-schema.json'; 

            right_format = "」にゃ~(white)";
            continuation_prompt = "▶▶";
	    add_newline = true; # ?
	    line_break.disabled = true; # ?

            username = {
	        disabled = false;
		format = "[$user ](#0099ff)";
		show_always = true;
                #style_user = "bg:#9A348E"; # ?
                #style_root = "bg:#9A348E"; # ?
	    };

            hostname = {
	        disabled = false;
		ssh_only = false;
		format = "on [$hostname](#ff3399) ";
		trim_at = ".";
	    };

	    directory = {
	        disabled = false;
		format = "in [$path]($style) ";
		truncation_length = 3;
		truncation_symbol = ".../";
		read_only = "";
	        substitutions = {
		    "~"="󰋜";
                    ".config"="";
                    "sync"="";
                    "games" = "";
                    "music" = "";
                    "Desktop" = "";
                    "Downloads" = "󰇚";
		};
	    };

            cmd_duration = {
	        disabled = true;
		min_time = 4;
		show_milliseconds = false;
		style = "bold italic red";
	    };

	    character = {
		success_symbol = "[ 「](white)";
                #success_symbol = "[>ω<〜☆](bold green)";
                error_symbol = "[ >_< 「](bold red)";
                #error_symbol = "[ノ_<](bold red)"
	    };

	    # Disable the package module, hiding it from the prompt completely
            package = {
	        disabled = false;
		symbol = " ";
            };

	    # Symbols preset - nerd fonts
	    aws.symbol = "  ";
	    buf.symbol = " ";
            c.symbol = " ";
	    conda.symbol = " ";
	    dart.symbol = " ";
	    docker_context.symbol = " ";
	    elixir.symbol = " ";
	    elm.symbol = " ";
	    golang.symbol = " ";
	    haskell.symbol = " ";
	    hg_branch.symbol = " ";
	    java.symbol = " ";
	    julia.symbol = " ";
	    lua.symbol = " ";
	    memory_usage.symbol = " ";
	    meson.symbol = "喝 ";
	    nim.symbol = " ";
	    nix_shell.symbol = " ";
	    nodejs.symbol = " ";
	    python.symbol = " ";
	    rlang.symbol = "ﳒ ";
	    ruby.symbol = " ";
	    rust.symbol = " ";
	    scala.symbol = " ";
	    spack.symbol = "🅢 ";

	    # git
            git_branch = {
                symbol = " ";
                #[git_status] = {
                    #style = "167"
                    #conflicted = "🏳"
                    #ahead = "🏎💨"
                    #behind = "😰"
                    #diverged = "😵"
                    #up_to_date = "✓"
                    #untracked = "🤷‍"
                    #stashed = "📦"
                    #modified = "📝"
                    #staged = '[++\($count\)](green)'
                    #renamed = "👅"
                    #deleted = "🗑"
	        #};
	    };
	};
    };
}
