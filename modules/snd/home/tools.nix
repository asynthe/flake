{ config, pkgs, ... }: {

  home.package = builtins.attrValues {
    inherit
      (pkgs)
      lame
      exactaudiocopy
      mediainfo
      sox
      ;
  };
}
