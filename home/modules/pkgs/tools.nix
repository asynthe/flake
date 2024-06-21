{ pkgs, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)

            # DevOps
            ollama
            pulumi
            opentofu #terraform
            ansible

            # Assembly
            nasm nasmfmt
            yasm

            # Reverse engineering / Disassemblers
            #ghidra-bin #ghidra
            #radare2
            #hopper
        ;
    };

}
