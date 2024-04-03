{ config, username, ... }: {

    programs.home-manager.enable = true;

    home = {
        username = username;
        homeDirectory = "/home/${username}";
        stateVersion = "23.11";
        sessionPath = [ "${config.home.homeDirectory}/.local/bin" ];
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

	    #IME # MOVE
            XMODIFIERS = "@im=fcitx";
            QT_IM_MODULE = "fcitx";
            SDL_IM_MODULE = "fcitx";
            GLFW_IM_MODULE = "ibus";
	    GTK_IM_MODULE = ""; # ?
        };
	enableNixpkgsReleaseCheck = false;
    };
}
