{ config, pkgs, ... }: {

    programs.zsh.shellAliases = {
        cat = "bat";
    };

    programs.bat = {
        enable = true;
    };
}
