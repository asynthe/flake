{ pkgs, ... }: {

    security.polkit = {
        enable = true;
    };

    environment.systemPackages = builtins.attrValues {
        inherit (pkgs)
            polkit
        ;
    };
}
