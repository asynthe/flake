{pkgs, ...}: {
  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      arp-scan
      macchanger
      netdiscover
      dsniff
      wireshark #tshark #termshark # network protocol analyzer

      # Reverse engineering / Disassemblers
      #ghidra ghidra-bin
      #radare2
      #hopper

      # Encryption
      gnupg
      pam_gnupg
      pinentry-curses
      age
      rage
      signing-party
      graphviz
      ;
  };
}
