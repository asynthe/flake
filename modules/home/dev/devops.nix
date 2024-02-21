{ pkgs, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)
            # Pulumi
            #pulumi
            #pulumictl

	    # Nix
	    deploy-rs
	    nixops_unstable #nixops
	    direnv
	    nix-direnv

	    # Use as `nom`, works like `nix` but with more details.
	    nix-output-monitor 

            # AWS
            #awscli
            #awscli2

            # Ansible
            #ansible 
	    #ansible-lint

            # Terraform
            opentofu terraform
            #terraformer
            #terraforming
            #terraform-lsp
	    #vagrant
        ;
    };
}
