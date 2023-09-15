{pkgs, ...}: {
  home.packages = with pkgs; [
    arp-scan
    macchanger
    netdiscover
    dsniff
    wireshark #tshark #termshark # network protocol analyzer

    # Reverse engineering / Disassemblers
    #ghidra ghidra-bin
    #radare2
    #hopper
  ];
}
