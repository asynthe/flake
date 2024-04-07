{ config, pkgs, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)

	    # Scanning
	    masscan	
	    nmap
	    rustscan

	    # Networking
	    arp-scan
	    macchanger
	    netcat-openbsd
	    socat
	    tcpdump
	    #tshark
	    wireshark #wireshark-cli

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
