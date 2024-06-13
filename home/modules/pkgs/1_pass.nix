{ pkgs, ... }: {
    home.packages = builtins.attrValues {
        inherit (pkgs)
            pass-wayland
        ;
    };
}
