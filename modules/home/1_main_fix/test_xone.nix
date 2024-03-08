{ pkgs, ... }: {

  home.packages = builtins.attrValues {
    #inherit (pkgs.linuxKernel.packages.linux_zen) xone;
    };
}
