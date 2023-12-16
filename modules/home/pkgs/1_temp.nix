{ pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      libgccjit
      # Pulumi (IaC)
      pulumi-bin #pulumi
      #pulumictl

      wacomtablet
      libwacom
      ;
  };
}



