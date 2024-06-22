{ config, pkgs, ... }: 
let
    home = builtins.getEnv "HOME";
    user = builtins.getEnv "USER";
    locale = "en_US.UTF-8";
in {

    xdg = {
        configHome = "${config.home.homeDirectory}/.config";
        userDirs = {
            enable = true;
            createDirectories = false;
            music = "${config.home.homeDirectory}/sync/archive/music";
        };
    };

    home.sessionVariables = {

        TERMINAL = "${pkgs.wezterm}/bin/wezterm";
        EDITOR = "${pkgs.neovim}/bin/nvim";
	    VISUAL = "${pkgs.neovim}/bin/nvim";
        LC_ALL = locale;
        LANG = locale;

	    # XDG
        XDG_BIN_HOME = "${config.home.homeDirectory}/.local/bin";
        XDG_CACHE_HOME = "${config.home.homeDirectory}/.cache";
        XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
        XDG_DATA_HOME = "${config.home.homeDirectory}/.local/share";
        XDG_SCREENSHOTS_DIR = "${config.home.homeDirectory}/Downloads/screenshots";
        XDG_STATE_HOME = "${config.home.homeDirectory}/.local/state";
    };
}
