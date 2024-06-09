{ pkgs, pkgs-stable, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs-stable)

	    # ...

	;
        inherit (pkgs)

	    # Tools # MOVE
	    bc
	    curl
	    jq
	    lsof
	    usbutils
        # ------------------------------------

        # Tools
	    sqlmap # SQL Injection
	    wpscan # Wordpress
	    joomscan # Joomla
	    exiftool # Image
	    seclists # Dictionaries and more
        social-engineer-toolkit
        snort

	    # Framework
	    metasploit

	    # OSINT
	    maltego
	    sherlock

	    # Pentesting
	    crackmapexec netexec
	    exploitdb
        
	    # Brute Forcing
	    thc-hydra

        # Password Cracking
        hashcat hashcat-utils
        john
        hcxtools

	    # Networking
	    arp-scan
	    macchanger
	    netcat-openbsd rlwrap
	    netdiscover
	    socat
	    tcpdump
        dsniff
	    #tshark
	    wireshark #wireshark-cli

	    # Networking - Port Scanning
	    masscan	
	    nmap # A utility for network discovery and security auditing.
	    rustscan

	    # Web
	    burpsuite
	    openssl

	    # Web
        ## Fuzzing
	    dirb
	    dirbuster
	    ffuf
	    gobuster
	    wfuzz
	    ## Recon
	    whatweb
        amass
        assetfinder
        gowitness
        httprobe
        subfinder
        whois
	    #sslyze # Not on nixpkgs.
	    sslscan

	    # SMB / Samba
	    cifs-utils
	    samba
	    smbmap

        # Wi-Fi
        aircrack-ng
	;
	inherit (pkgs.unixtools)
	    xxd
	;
    };
}
