{ config, ... }: {

    imports = [

        # Main
        #../../modules/home/pkgs_full.nix
        #../../modules/home/pkgs_test.nix

        # Testing, delete when finished
        #../../modules/home/test_tmux.nix
        #../../modules/home/test_xone.nix

	# App
        #../../modules/home/dev/3d.nix # 3D viewers and tools.
        #../../modules/home/app/dots.nix # ?
        #../../modules/home/app/emulation.nix
        #../../modules/home/app/game.nix
        #../../modules/home/app/image.nix # Tools for inspection of images.
        #../../modules/home/app/lf.nix
        #../../modules/home/app/neomutt.nix
        #../../modules/home/app/nvim.nix
        #../../modules/home/app/subtitle.nix # Subtitle editors.
        #../../modules/home/app/video.nix # Tools for editing and creating videos.

        # Audio
        #../../modules/home/audio/daw.nix # Audio and sound packages.
        #../../modules/home/audio/music_player.nix
        #../../modules/home/audio/pkgs.nix # Audio apps and packages.
        #../../modules/home/audio/tools.nix
        #../../modules/home/audio/ncmpcpp.nix

        # Developer tools
        #../../modules/home/dev/assembly.nix
        #../../modules/home/dev/devops.nix
        #../../modules/home/dev/gamedev.nix
        #../../modules/home/dev/lua.nix
        #../../modules/home/dev/rust.nix

        # Networking Tools
        #../../modules/home/net/net.nix # Networking tools.
        #../../modules/home/net/xmpp.nix # XMPP Chat.
        
        # Security Tools
        #../../modules/home/sec/sec.nix # Cybersecurity tools.

        #../../modules/home/sys/fonts.nix
        #../../modules/home/sys/shell.nix
        #../../modules/home/sys/system.nix 
        #../../modules/home/sys/uutils-replace.nix
        #../../modules/home/sys/xdg.nix

        # systemd
        #../../modules/home/systemd/services.nix
    ];
}
