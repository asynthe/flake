{ pkgs, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)
            #minecraft #minecraft-server
            gzdoom
            #zandronum #zandronum-server
            #stepmania
            #osu-lazer # No score submission or multiplayer.
            #osu-lazer-bin # AppImage ver. (w score submission and multiplayer)
            #clonehero # NOT WORKING (17-09-2023)
        ;
    };
}
