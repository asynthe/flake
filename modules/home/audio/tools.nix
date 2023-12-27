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
      #losslessaudiochecker # LAC
      #exactaudiocopy # EAC
      mediainfo
      #sox
      friture # Real-time audio analyzer.

      # CD / DVD Tools
      #cdemu-client #cdemu-daemon
      #gcdemu
      ;
  };

}
