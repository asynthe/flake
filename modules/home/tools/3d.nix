{ pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit (pkgs)
      #blender #blender-hip
      #openscad
      meshlab
      f3d # fast and minimalistic 3D viewer
      fstl # The fastest STL file viewer
    ;
  };

}
