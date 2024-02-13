{ pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit (pkgs)

      # AWS
      #awscli
      awscli2

      # Ansible
      ansible
      ansible-lint

      # Terraform
      terraform
      #terraformer
      #terraforming
      #terraform-lsp
      opentofu

      # Pulumi
      pulumi
      pulumictl
      ;
  };

}
