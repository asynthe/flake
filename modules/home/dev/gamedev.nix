{ config, pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit (pkgs)
      blender #blender-hip
      ;
  };

}
