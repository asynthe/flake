{ pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      nasm
      yasm
      # Formatter
      nasmfm

      # Reverse engineering / Disassemblers
      ghidra-bin #ghidra
      #radare2
      #hopper
      ;
  };

}
