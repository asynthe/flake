{pkgs, ...}: {
  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      # Linux Basics for Hackers
      aircrack-ng
      snort

      # Ethical Hacking
      arp-scan
      macchanger
      netdiscover
      dsniff
      wireshark #tshark #termshark # network protocol analyzer

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
