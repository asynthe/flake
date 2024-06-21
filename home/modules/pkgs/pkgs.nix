{ pkgs, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)

            # Nix
            colmena
            deploy-rs
            #nixops_unstable #nixops
            nixfmt
            alejandra

            # Social
            signal-desktop
            telegram-desktop
            weechat hexchat # IRC
            webcord #discord # fuck discord

	        # Terminal
	        kitty
            cool-retro-term
            powershell

            # GUI
            #aegisub # Subtitle Editor
	        emacs29-pgtk
	        #etcher
	        #gimp-with-plugins #gimp # Remember to configure photogimp.
	        gparted
	        hypnotix
	        keepassxc
	        #libreoffice
	        #obsidian
	        ungoogled-chromium #brave
	        ventoy-full #ventoy
            #aegisub
            #davinci-resolve # Not working.
            #kdenlive
            #nicotine-plus
            qmmp
            #wf-recorder

            # CLI
	        hyperfine
	        imagemagickBig #imagemagick
	        img2pdf
	        libqalculate
            cmus # Music player
            cpu-x
            ffmpeg
            mediainfo # Video/audio metadata
            #meshlab #f3d #fstl # 3D files
            ripgrep
            sox
            tectonic # LaTeX Engine
            tesseract easyocr # OCR

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

            # File Manager - PCmanFM
            pcmanfm
            nufraw-thumbnailer # .raw files (raw-thumbnailer)
            evince # Adobe .pdf files
            ffmpegthumbnailer # Video files
            freetype # Font files
            libgsf # .odf files

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
        # File managers
        inherit (pkgs.libsForQt5) dolphin; 
        inherit (pkgs.xfce) thunar tumbler;
    };
}
