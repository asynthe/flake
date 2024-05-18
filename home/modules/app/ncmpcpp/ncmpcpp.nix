{ config, pkgs, ... }: {

    imports = [
        ./bindings.nix
        ./interface.nix
    ];

    programs.ncmpcpp = {
        enable = true;
        package = pkgs.ncmpcpp.override {
            visualizerSupport = true;
            clockSupport = true;
            #taglibSupport = true;
        };
        settings = {
            ncmpcpp_directory = ''"${config.xdg.configHome}/ncmpcpp"'';
            #lyrics_directory = ''"~/.local/share/lyrics"'';
            mpd_music_dir = ''"${config.xdg.userDirs.music}"'';
            mpd_host = ''"localhost"'';
            mpd_port = ''"6600"'';
            mpd_crossfade_time = ''"6"'';
        };
    };
}