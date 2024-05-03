{ pkgs, pkgs-stable, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs-stable)

	        # ...

	    ;
        inherit (pkgs)

	        # Temporary
	        barrier # Open-source KVM software.
	        brave
	        bucklespring-libinput # Requires user in `input` group.
	        gnumake
	        gopass # -> pass !
	        pass-wayland # -> pass !
	        tor-browser

	        # Networking
	        ciscoPacketTracer8
	        gns3-gui gns3-server

	        # Terminal
	        alacritty kitty
            cool-retro-term

            # Tools - GUI
	        emacs29-pgtk
	        gimp pinta
	        hypnotix
	        keepassxc
	        libreoffice
	        obsidian

	        # Tools - Presenting
	        slides
	        #zoom-us
	        #slack #slack-cli #slack-term # ?

	        # Tools - Partitioning / Formatting
	        #etcher
	        gparted
	        ventoy-full #ventoy

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
	    ;
    };
}
