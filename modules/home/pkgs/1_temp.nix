{ pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit
      (pkgs)

      # Pulumi (IaC)
      pulumi-bin #pulumi
      #pulumictl
      ;
  };
}



