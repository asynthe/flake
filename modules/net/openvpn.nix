{ config, pkgs }: {

  environment.systemPackages = builtins.attrValues {
    inherit
      (pkgs)
      openvpn
      openvpn3
      ;
  };
}
