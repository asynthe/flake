{ config, pkgs, ... }: {

    xdg = {
        configHome = "${config.home.homeDirectory}/.config";
        userDirs = {
            enable = true;
            createDirectories = false;
            music = "${config.home.homeDirectory}/sync/archive/music/ALBUM";
        };
    };

    home.sessionVariables = {

        TERMINAL = "${pkgs.wezterm}/bin/wezterm";
        EDITOR = "${pkgs.neovim}/bin/nvim";
	    VISUAL = "${pkgs.neovim}/bin/nvim";

	    # XDG
        XDG_CACHE_HOME = "${config.home.homeDirectory}/.cache";
        XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
        XDG_BIN_HOME = "${config.home.homeDirectory}/.local/bin";
        XDG_DATA_HOME = "${config.home.homeDirectory}/.local/share";
        XDG_STATE_HOME = "${config.home.homeDirectory}/.local/state";
    };
}
