{ config, pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit (pkgs)

      ansible ansible-lint
      vagrant
      terraform

      # Nix
      deploy-rs
      nixops_unstable #nixops
      direnv
      nix-direnv
      nix-output-monitor # use as `nom`, works like `nix` but with more details
      ;
  };
}
