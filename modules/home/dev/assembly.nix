{ pkgs, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)
            nasm nasmfmt      
            yasm

            # Reverse engineering / Disassemblers
            #ghidra-bin #ghidra
            #radare2
            #hopper
        ;
    };
}
