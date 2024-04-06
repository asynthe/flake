{ pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit 
      (pkgs)

      # DAWs - Digital Audio Workstation
      #ardour
      #renoise
      #reaper

      # Paid
      #bitwig-studio
    
      # DJ mixer
      mixxx

      # Audio editors
      #ocenaudio #audacity
    ;
  };

}
