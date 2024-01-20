{ config, pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit (pkgs)
      
      # Testing
      calcurse
      wayfire

      # GNU TOOLS
      #at
      #cowsay
      #file
      #which
      #tree
      #gnused
      #gnutar
      #gawk
      #zstd
      #vscodium #vscodium-fhs # test how compatible vscode is w nixos

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
