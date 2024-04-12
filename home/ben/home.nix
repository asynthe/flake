{ config, username, ... }: {

    programs.home-manager.enable = true;

    home = {
        username = username;
        homeDirectory = "/home/${username}";
        stateVersion = "23.11";
        sessionPath = [ "${config.home.homeDirectory}/.local/bin" ];
    };
}
