{ pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit (pkgs)

      # Removing fingerprints
      exiftool

      # Linux Basics for Hackers
      metasploit
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
      ;
  };
}
