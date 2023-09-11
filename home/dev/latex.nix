{pkgs, ...}: {
  home.packages = builtins.attrValues {
    # LaTeX Packages
    inherit
      (pkgs)

      pandoc
      tectonic # self-contained TeX/LaTeX engine, powered by XeTeX and TeXLive
      #tikzit
      #auto-multiple-choice
      
      ;

    # TeX Suite
    inherit
      (pkgs.textlive.combined)

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
