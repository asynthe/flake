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
      dsniff # dnssniff, ...
      wireshark #tshark #termshark # network protocol analyzer

      # Password Cracking
      hashcat hashcat-utils
      john
      hcxtools

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
