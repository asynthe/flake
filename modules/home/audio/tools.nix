{ pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit
      (pkgs)

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
      ;
  };

}
