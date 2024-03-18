{ pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit (pkgs)
      nasm
      yasm
      # Formatter
      nasmfmt      

      # Reverse engineering / Disassemblers
      #ghidra-bin #ghidra
      #radare2
      #hopper
      ;
  };

}
