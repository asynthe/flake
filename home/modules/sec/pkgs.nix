{ config, pkgs, pkgs-stable, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs-stable)

	    # ...

	;
        inherit (pkgs)

	    # Tools
	    bc
	    curl
	    jq
	    lsof
	    usbutils

	    # Brute Forcing
	    seclists
	    thc-hydra

	    # Image
	    exiftool

	    # Networking
	    arp-scan
	    macchanger
	    netcat-openbsd
	    netdiscover
	    socat
	    tcpdump
	    #tshark
	    wireshark #wireshark-cli

	    # Networking - Port Scanning
	    masscan	
	    nmap
	    rustscan

	    # Web
	    burpsuite
	    whatweb

	    # Web - Fuzzing
	    ffuf
	    gobuster
	    wfuzz

	;
	inherit (pkgs.unixtools)
	    xxd
	;
    };
}
