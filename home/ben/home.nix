{ config, pkgs, username, ... }: {

    home = {
        username = username;
        homeDirectory = "/home/${username}";
        stateVersion = "23.11";
        sessionVariables = {
            
	    TERMINAL = "Alacritty";
            EDITOR = "nvim";
	    VISUAL = "nvim";
        };
    };
}
