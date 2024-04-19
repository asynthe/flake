{ config, pkgs, pkgs-stable, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs-stable)

	    # ...

	;
        inherit (pkgs)

	    # SMB / Samba
	    samba

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
	    openssl

	    # Web - Fuzzing
	    dirb
	    dirbuster
	    ffuf
	    gobuster
	    wfuzz

	    # Web - Recon
	    whatweb
	    #sslyze # Not on nixpkgs.
	    sslscan
	;
	inherit (pkgs.unixtools)
	    xxd
	;
    };
}
