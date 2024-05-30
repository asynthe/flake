{ pkgs }: {
    home.packages = builtins.attrValues {
        inherit (pkgs)
            #qbittorrent
            qbittorrent-nox
        ;
    };
}
