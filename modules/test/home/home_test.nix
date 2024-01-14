{ config, pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit (pkgs)
      
      # ai.nix ?
      ollama

      # GNU TOOLS
      at
      #cowsay
      #file
      #which
      #tree
      #gnused
      #gnutar
      #gawk
      #zstd
      #vscodium #vscodium-fhs # test how compatible vscode is w nixos

      # Nix -> devops.nix?
      deploy-rs
      nixops_unstable #nixops
      direnv
      nix-direnv
      nix-output-monitor # use as `nom`, works like `nix` but with more details

      # Browser
      #nyxt #links2
      brave
      arti

      # Task management
      #taskwarrior
      #taskserver
      #taskell # command-line kanban board/task manager
      #vit
      #todo-txt-cli

      # PCB Design
      #kicad-unstable
      #kicad #kicad-small
      ;
  };
}
