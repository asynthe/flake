{ pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      libgccjit
      # Pulumi (IaC)
      pulumi-bin #pulumi
      #pulumictl

      hexchat
      wacomtablet
      libwacom
      ;
  };
}



