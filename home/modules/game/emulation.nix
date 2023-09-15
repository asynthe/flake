{pkgs, ...}: {

  # Personal list of emulators.

  home.packages = builtins.attrValues {
    inherit
      (pkgs)

      # RetroArch
      retroarchFull # Retroarch with all the libraries
      #(retroarch.override { # Retroarch with specific libraries
      #cores = with libretro; [
      #genesis-plus-gx
      #snes9x
      #beetle-psx-hw
      #];
      #})

      # SONY
      #ppsspp #ppsspp-qt # PSP
      #ppsspp-sdl-wayland # PSP on wayland
      pcsx2 # PS2
      rpcs3 # PS3
      mgba #vbam # GAME BOY ADVANCE

      # SEGA
      #flycast # SEGA DREAMCAST / NAOMI / ATOMISWAVE
      #redream # SEGA DREAMCAST (not yet implemented)

      # MICROSOFT
      #xemu # XBOX

      # NINTENDO
      snes9x
      zsnes
      bsnes-hd # SUPER NINTENDO
      mupen64plus # NINTENDO 64
      dolphin-emu # GAMECUBE / WII
      #desmume # DS
      #citra-nightly #citra-canary # 3DS
      cemu # WII U
      yuzu-mainline ryujinx # SWITCH

      # VARIOUS
      #mame #mame-tools
      #dosbox #dosbox-staging # DOS
      #mednafen
      #mednaffe # frontend for mednafen
      ;
  };
}
