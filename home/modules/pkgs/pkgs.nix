{ pkgs, pkgs-stable, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs-stable)
	        # ...
	    ;
        inherit (pkgs)

            # Get all the wayland / X11 specific ?
            # Move general audio?

            # MOVE THESE TOOLS ?
            ollama

            # Social
            signal-desktop
            telegram-desktop
            weechat hexchat # irc
            webcord #discord # fuck discord

	        # Terminal
	        kitty
            cool-retro-term
            powershell

            # GUI
	        ungoogled-chromium #brave
	        emacs29-pgtk
	        #gimp-with-plugins #gimp # Remember to configure photogimp.
	        hypnotix
	        keepassxc
	        #libreoffice
	        #obsidian
	        #etcher
	        gparted
	        ventoy-full #ventoy
            wf-recorder
            #kdenlive
            #davinci-resolve # Not working.

            # CLI
            pass-wayland
	        hyperfine
	        imagemagickBig #imagemagick
	        img2pdf
	        libqalculate
            cpu-x
            ffmpeg
            mediainfo # Video/audio metadata
            tectonic # LaTeX Engine
            sox
            tesseract easyocr # OCR
            meshlab f3d fstl # 3D files
            cmus # Music player

            # System
            inxi
            btop
            strace # System call monitoring
            ltrace # Library call monitoring
            iotop # IO monitoring
            iftop # Network monitoring
            lsof # List open files
            lshw # List hardware details
            sysstat
            lm_sensors # for `sensors` command
            ethtool
            pciutils # lspci
            usbutils # lsusb

            # Networking
            nethogs
            mtr # A network diagnostic tool
            iperf3
            dnsutils # `dig` + `nslookup`
            ldns # replacement of `dig`, it provide the command `drill`
            ipcalc # it is a calculator for the IPv4/v6 addresses
            #inetutils
            dnsmasq
            traceroute
            filezilla
            dig
            netcat-openbsd #netcat #netcat-gnu
            socat #websocat
            putty

            # File Manager - PCmanFM
            pcmanfm
            nufraw-thumbnailer # .raw files (raw-thumbnailer)
            evince # Adobe .pdf files
            ffmpegthumbnailer # Video files
            freetype # Font files
            libgsf # .odf files

            # Reverse Engineering
            nasm nasmfmt
            yasm

            # Reverse engineering / Disassemblers
            #ghidra-bin #ghidra
            #radare2
            #hopper

            # Archiving
	        #mdf2iso
            p7zip
            rar #unrar #rar2fs
            #torrent7z
            unar # Allows for unzipping with Unicode characters.
            #xz
            zip unzip 

            # Bluetooth
            bluetuith
            bluez
            bluez-tools

	        # Japanese
	        #anki-bin
	        memento

	        # Astronomy
	        #celestia
	        #libnova
	        stellarium
            starfetch

	        # Fun
	        cava
	        cli-visualizer
	        figlet
	        lolcat
	        nhentai # ( ͡° ͜ʖ ͡°) 
	        peaclock tty-clock
	        pulsemixer #pulseaudioFull
	        unimatrix
            pfetch neofetch
            pipes-rs
            pv
	    ;
    };
}
