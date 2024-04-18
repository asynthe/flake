{ config, user, ... }: {

    programs.home-manager.enable = true;

    home = {
        username = user;
        homeDirectory = "/home/${user}";
        stateVersion = "23.11";
        sessionPath = [ "${config.home.homeDirectory}/.local/bin" ];
    };
}
