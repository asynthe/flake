{ pkgs, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)
            pandoc
            tectonic # self-contained TeX/LaTeX engine, powered by XeTeX and TeXLive
        ;

        # TeX Suite
        inherit (pkgs.texlive.combined)
            scheme-full
            #scheme-medium
            #scheme-small
            #scheme-basic
            #scheme-minimal
            #scheme-infraonly
            #scheme-gust
            #scheme-context
        ;
    };
}
