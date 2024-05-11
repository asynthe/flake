{ config, pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit (pkgs)
      
      # Testing
      calcurse

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
