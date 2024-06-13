{ pkgs, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)

            # SEPARATE CLI AND GUI
            # DELETE THOSE YOU KNOW WILL NOT BE USED
            # MOVE TO WAYLAND
            # MOVE TO X11
            # MOVE TO MINIMAL (ONLY CLI)
            # MOVE TO NORMAL (CLI)
            # MOVE TO NORMAL (GUI)

            # DevOps
            # Pulumi
            #pulumi
            #pulumictl
	        # Nix
	        deploy-rs
	        nixops_unstable #nixops
	        direnv
	        nix-direnv

            # AWS
            #awscli
            #awscli2

            # Ansible
            #ansible 
	        #ansible-lint

            # Terraform
            opentofu terraform
            #terraformer
            #terraforming
            #terraform-lsp
	        #vagrant

            # Tools
            #linthesia # Synthesia replacement

            # Audio Tools
            #yabridge #yabridgectl
            #asunder # CD ripper and encoder
            #cadence # catia
            #patchance # JACK patchbay GUI
            #helvum # gtk patchbay for pipewire
            #easyeffects
            #qpwgraph
            #mp3gain

            # Sound volume
            alsa-utils # for alsa-mixer
            pavucontrol
            pulsemixer
            #ncpamixer
      
            # Soulseek
            nicotine-plus #soulseekqt

            # DAWs - Digital Audio Workstation
            #ardour
            #renoise
            #reaper
            #bitwig-studio # paid
    
            # DJ mixer
            mixxx

            # Audio editors
            #ocenaudio #audacity

            # Music Players
            #cmus
            #qmmp

            # MP3
            #lame

            # Tag editors
            #easytag
            #tagger
            #puddletag
            #kid3

            # Tools
            sox
            mediainfo
            #losslessaudiochecker # LAC
            #exactaudiocopy # EAC
            #friture # Real-time audio analyzer.

            # CD / DVD Tools
            #cdemu-client #cdemu-daemon
            #gcdemu

            # System
            inxi
            btop
            strace # System call monitoring
            ltrace # Library call monitoring
            iotop # IO monitoring
            iftop # Network monitoring
            lsof # List open files
            lshw # List hardware details

            # Replace in future
            bless
            hexedit
            hexyl # Hex editor

            # System Tools
            sysstat
            lm_sensors # for `sensors` command
            ethtool
            pciutils # lspci
            usbutils # lsusb

            # Subtitle Editors
            subtitleedit
            subtitleeditor
            aegisub
            subedit

            # Apps
            ueberzugpp # file manager
            ripdrag # drag-and-drop for terminal
            cli-visualizer
            cava # audio visualizer
            pipes-rs #pipes
            peaclock #tty-clock
            cmatrix
            hollywood
            figlet
            lolcat
            pfetch #neofetch #ipfetch #macchina
            pv

            # Customization
            pywal
            wpgtk
            colorz

            # Code formatters
            nixfmt
            alejandra # nix

            # Terminal Apps
            ripgrep
            hyperfine
            tree
            wget
            rsync
            ncdu
            killall
            btop
            htop
            entr
            acpi
            #beets
            offlineimap
            gammastep
      links2
      tldr
      epr
      libcryptui
      broot
      harfbuzz
      pciutils
      curl
      dconf
      lshw
      fontconfig
      file
      gnumake
      sosreport
      xsos
      #nodejs
      #wmctrl
      xdotool
      neofetch

      trashy
   
      # GUI
      font-manager
            # Test
            calcurse
            # Task management
            #taskwarrior
            #taskserver
            #taskell # command-line kanban board/task manager
            #vit
            #todo-txt-cli

            # PCB Design
            #kicad-unstable
            #kicad #kicad-small
        
            # Image
            gimp-with-plugins #gimp # Replaced for flatpak gimp + photogimp.
            #krita
            #inkscape-with-extensions #inkscape
            #darktable
            #rawtherapee # RAW images editor.
            imagemagick # Image editing.
            exif # Image metadata.

            # 3D Files and Models
            #openscad
            meshlab
            f3d # fast and minimalistic 3D viewer
            fstl # The fastest STL file viewer

            # OCR
            tesseract
	        qt-box-editor
	        easyocr

            # Download / torrent
            aria2 # A lightweight multi-protocol & multi-source command-line download utility
            wirelesstools # Maybe replace in future?
            #socat # replacement of openbsd-netcat
            bc

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
            networkmanagerapplet
            filezilla
            dig
            netcat-openbsd #netcat #netcat-gnu
            socat #websocat
            putty
            openvpn3 #openvpn

            # Browser
            librewolf #librewolf-unwrapped
            mullvad-browser
            #ungoogled-chromium #chromium # Already on default list.
      
            # File managers
            pcmanfm
            # Thumbnailers (for PCmanFM)
            nufraw-thumbnailer # .raw files (raw-thumbnailer)
            evince # Adobe .pdf files
            ffmpegthumbnailer # Video files
            freetype # Font files
            libgsf # .odf files
        ;
        
        # Previewers for PCmanFM
        inherit (pkgs.libsForQt5) dolphin; # File manager
        inherit (pkgs.xfce) thunar tumbler; # Image files

        # Alarm Clocks
        inherit (pkgs.gnome) gnome-clocks;
        inherit (pkgs.libsForQt5) kalarm;
    };
}
