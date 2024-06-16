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

            # Replace in future
            bless
            hexedit
            hexyl # Hex editor

            # Subtitle Editors
            subtitleedit
            subtitleeditor
            aegisub
            subedit

            # Apps
            ripdrag # drag-and-drop for terminal

            # Code formatters
            nixfmt
            alejandra # nix

            # Terminal Apps
            ripgrep
            hyperfine
            tree
            entr
            acpi
            #beets
            gammastep
            tldr
            epr
            libcryptui
            broot
            harfbuzz
            pciutils
            curl
            dconf
            lshw

            # Test
            calcurse
            # Task management
            #taskwarrior
            #taskserver
            #taskell # command-line kanban board/task manager
            #vit
            #todo-txt-cli

        ;
        
        # Previewers for PCmanFM
        inherit (pkgs.libsForQt5) dolphin; # File manager
        inherit (pkgs.xfce) thunar tumbler; # Image files

        # Alarm Clocks
        inherit (pkgs.gnome) gnome-clocks;
        inherit (pkgs.libsForQt5) kalarm;
    };
}
