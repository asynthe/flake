{ config, ... }: {

    imports = [
        ./bindings.nix
        ./interface.nix
    ];

    programs.ncmpcpp = {
        enable = true;
        #package = pkgs.ncmpcpp.override {
            #visualizerSupport = true;
            #clockSupport = true;
            #taglibSupport = true;
        #};
        settings = {
            ncmpcpp_directory = ''"${config.xdg.configHome}/ncmpcpp"'';
            #lyrics_directory = ''"~/.local/share/lyrics"'';
            #mouse_support = "no";
            allow_for_physical_item_deletion = "no";
            mpd_crossfade_time = ''"6"'';
            mpd_host = ''"localhost"'';
            mpd_music_dir = ''"${config.xdg.userDirs.music}"'';
            mpd_port = ''"6600"'';
        };
    };
}
