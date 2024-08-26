{ pkgs, ... }: {

    environment.systemPackages = builtins.attrValues {
        inherit (pkgs)
            lf
        ;
    };
}
