{ pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit (pkgs)

      # Nmap
      # A utility for network discovery and security auditing.
      nmap
      rustscan

      # Removing fingerprints
      exiftool

      # from Linux Basics for Hackers
      metasploit
      aircrack-ng
      snort

      # from Ethical Hacking
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
