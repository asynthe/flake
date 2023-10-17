{pkgs, ...}: {
  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      bc
      qgis #qgis-ltr
      nethogs
      mtr # A network diagnostic tool
      iperf3
      dnsutils # `dig` + `nslookup`
      ldns # replacement of `dig`, it provide the command `drill`
      aria2 # A lightweight multi-protocol & multi-source command-line download utility
      socat # replacement of openbsd-netcat
      nmap # A utility for network discovery and security auditing
      ipcalc # it is a calculator for the IPv4/v6 addresses
      #inetutils
      dnsmasq
      traceroute
      networkmanagerapplet
      filezilla
      sshfs
      dig
      netcat-openbsd #netcat #netcat-gnu
      socat #websocat
      putty
      openvpn3 #openvpn
      ;
  };
}
