{ config, pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      lame
      exactaudiocopy
      mediainfo
      sox
      ;
  };
}
