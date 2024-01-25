{ pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit (pkgs)
      awscli
      ansible
      ansible-lint
      terraform
      #terraformer
      #terraforming
      #terraform-lsp

      # Pulumi
      pulumi
      pulumictl
      ;
  };

}
