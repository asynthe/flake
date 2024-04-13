{ config, pkgs, pkgs-unstable, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs-unstable)
	    tshark
	;
        inherit (pkgs)

	    # CLI
	    lsof
	    usbutils

	    # Scanning
	    masscan	
	    nmap
	    rustscan

	    # Networking
	    arp-scan
	    netdiscover
	    macchanger
	    netcat-openbsd
	    socat
	    tcpdump
	    #tshark
	    #wireshark #wireshark-cli

	    # Recon
	    gobuster

	    # Tools
	    bc
	    curl
	    jq
	;
	inherit (pkgs.unixtools)
	    xxd
	;
    };
}
