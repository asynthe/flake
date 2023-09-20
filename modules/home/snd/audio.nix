{ pkgs, ... }: {


  home.packages = builtins.attrValues {
    inherit
      (pkgs)

      # Tools
      #yabridge #yabridgectl
      linthesia # Synthesia replacement
      asunder # CD ripper and encoder
      #ocenaudio #audacity
      cadence # catia
      patchance # JACK patchbay GUI
      helvum # gtk patchbay for pipewire
      easyeffects
      qpwgraph
      mp3gain

      # Audio visualizers
      cli-visualizer
      cava

      # Sound volume
      alsa-utils # for alsa-mixer
      pavucontrol
      pulsemixer
      ncpamixer

      # Music player
      playerctl # Manage audio daemon
      ncmpcpp
      cmus
      qmmp

      # Propietary
      spotify
      spotify-tui #spotify-qt
      #spotify-tray

      # Tag editors
      easytag
      tagger
      #puddletag
      #kid3

      # Soulseek
      nicotine-plus #soulseekqt

      # CD / DVD Tools
      #cdemu-client #cdemu-daemon
      #gcdemu
      ;
  };
}
