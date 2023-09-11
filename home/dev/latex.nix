{pkgs, ...}: {
  home.packages = builtins.attrValues {
    inherit
      (pkgs)

      pandoc
      tectonic # self-contained TeX/LaTeX engine, powered by XeTeX and TeXLive
      #tikzit
      #auto-multiple-choice

      # TeX Suite
      inherit (pkgs.texlive.combined) scheme-full
      #texlive.combined.scheme-medium
      #texlive.combined.scheme-small
      #texlive.combined.scheme-basic
      #texlive.combined.scheme-minimal
      #texlive.combined.scheme-infraonly
  
      #texlive.combined.scheme-gust
      #texlive.combined.scheme-context
      ;
  };
}
