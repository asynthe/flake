{ config, pkgs, pkgs-stable, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs-stable)

	    # ...

	;
        inherit (pkgs)

	    # Framework
	    metasploit

	    # OSINT
	    maltego
	    sherlock

	    # Pentesting
	    crackmapexec netexec
	    exploitdb

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
	    netcat-openbsd rlwrap
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

	    # SQL Injection
	    sqlmap

	    # SMB / Samba
	    cifs-utils
	    samba
	    smbmap

	    # CMS
	    wpscan
	    joomscan
	;
	inherit (pkgs.unixtools)
	    xxd
	;
    };
}
