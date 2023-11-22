{ config, pkgs, ... }: {

  imports = [
    ../../../machines/linux/laptop/sec_boot/lanzaboote.nix

  environment.systemPackages = builtins.attrValues {
    inherit (pkgs)
    sbctl niv
    ;
  };

}
