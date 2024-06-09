{ pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit (pkgs)
      subtitleedit
      subtitleeditor
      aegisub
      subedit
      ;
  };

}
