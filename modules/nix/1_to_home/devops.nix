{ config, pkgs, ... }: {

  environment.systemPackages = builtins.attrValues {
    inherit (pkgs)
      ansible ansible-lint
      vagrant
      terraform
      virtualenv
      ;
  };

}
