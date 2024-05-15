{ config, ... }: {
    home = {
        sessionVariables = {
	        TERMINAL = "Alacritty";
            EDITOR = "nvim";
	        VISUAL = "nvim";

	        # XDG
            XDG_CACHE_HOME = "${config.home.homeDirectory}/.cache";
            XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
            XDG_BIN_HOME = "${config.home.homeDirectory}/.local/bin";
            XDG_DATA_HOME = "${config.home.homeDirectory}/.local/share";
            XDG_STATE_HOME = "${config.home.homeDirectory}/.local/state";
        };
    };
}
