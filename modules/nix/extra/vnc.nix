{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = builtins.attrValues {
    inherit
      (pkgs)
      remmina
      wayvnc
      #x11vnc
      
      ;
  };
}
