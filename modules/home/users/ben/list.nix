{ config, ... }: {

  imports = [

    # Temp
    ../../../nix/vm/home_cursor_fix.nix # -> gtk? theme?

    #../../modules/test/home/home_test.nix # Temp file to test stuff
    #../../modules/test/home/xone_home.nix
    #../../modules/test/home/ai.nix

    # Apps
    #../../app/dots.nix
    ../../app/emacs.nix
    #../../app/neomutt.nix
    #../../app/nvim.nix
    ../../extra/comms.nix # Discord, IRC, Signal, Telegram.

    # Audio
    #../../audio/daw.nix # Audio and sound packages.
    #../../audio/music_player.nix
    #../../audio/pkgs.nix # Audio apps and packages.
    #../../audio/tools.nix

    #../../audio/ncmpcpp.nix
    #../../audio/mpd.nix

    # Developer tools
    #../../dev/3d.nix # 3D viewers and tools.
    #../../dev/assembly.nix
    #../../dev/devops.nix
    #../../dev/latex.nix
    #../../dev/lua.nix
    #../../dev/python.nix
    #../../dev/rust.nix
    #../../dev/tools.nix
    #../../dev/gamedev.nix # Blender, ...

    # Extra
    #../../extra/emulation.nix # Emulators.
    #../../extra/game.nix # Videogames.
    #../../extra/steam.nix # Steam. (also managed by Nix)

    # Main
    #../../main/coreutils.nix
    #../../main/fonts.nix
    #../../main/gtk.nix
    #../../main/jp.nix # Memento video player
    #../../main/pkgs.nix
    #../../main/shell.nix
    #../../main/system.nix # System utilities and tools.
    #../../main/xdg.nix

    # Media
    #../../media/image.nix # Tools for inspection of images.
    #../../media/subtitle.nix # Subtitle editors.
    #../../media/video.nix # Tools for editing and creating videos.

    #../../net/net.nix # Networking tools.
    #../../net/xmpp.nix # XMPP Chat.
    
    #../../sec/sec.nix # Cybersecurity tools.
    #../../timer/systemd.nix # systemd Timers (enable timers here or on default.nix?)
  ];
}
