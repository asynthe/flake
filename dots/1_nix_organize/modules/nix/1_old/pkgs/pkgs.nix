{ pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit
      (pkgs)

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

      # Audio visualizers
      cli-visualizer
      cava
      
      # Sound volume
      alsa-utils # for alsa-mixer
      pavucontrol
      pulsemixer
      #ncpamixer
      
      # Soulseek
      nicotine-plus #soulseekqt
      ;
  };

}
