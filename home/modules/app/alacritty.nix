{ config, ... }: {

    programs.alacritty = {
        enable = true;
	settings = {
	    env.TERM = "xterm-256color";
	    #live_config_reload = true;

	    cursor = {
	        style = "Block";
	        unfocused_hollow = false;
	    };

	    window = {
		opacity = 1;
		#opacity = 0.80;
		title = "Alacritty";
		class.general = "Alacritty";
		class.instance = "Alacritty";

	        dynamic_padding = false;

		# Small Padding
		#padding.x = 2;
		padding.x = 10;
	        padding.y = 6;

		# Big Padding
	        #padding.x = 20;
	        #padding.y = 15;
	    };

	    font = {
	        size = 12;
	        normal.family = "JetBrains Mono Nerd Font";
		normal.style = "Regular";
	        italic.family = "JetBrains Mono Nerd Font";
		italic.style = "Italic";
	        bold.family = "JetBrains Mono Nerd Font";
		bold.style = "Bold";
	        bold_italic.family = "JetBrains Mono Nerd Font";
		bold_italic.style = "Bold Italic";
	    };

	    scrolling = {
		history = 5000;
		multiplier = 3;
	    };

	    #keyboard.bindings = {
	        #.
	    #};

	    colors = {
	        draw_bold_text_with_bright_colors = true;
		cursor = {
                    cursor = "0xffffff";
                    text = "0xF81CE5";
		};
		primary = {
                    background = "0x000000";
                    foreground = "0xffffff";
		};
		normal = {
                    black = "0x000000";
                    blue = "0x0066ff";
                    cyan = "0x00ffff";
                    green = "0x33ff00";
                    magenta = "0xcc00ff";
                    red = "0xfe0100";
                    white = "0xd0d0d0";
                    yellow = "0xfeff00";
		};
		bright = {
                    black = "0x808080";
                    blue = "0x0066ff";
                    cyan = "0x00ffff";
                    green = "0x33ff00";
                    magenta = "0xcc00ff";
                    red = "0xfe0100";
                    white = "0xFFFFFF";
                    yellow = "0xfeff00";
		};
	    };
	};
    };
}
