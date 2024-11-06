{
    #programs.openvpn3.enable = true;
    #services.openvpn = {
      #servers = {
        #<name> = {
          #autoStart = ; # Default `true`.
          #updateResolvConf = ; # Default `false`.
          #restartAfterSleep = ; # Default `true`.
          #config = "config /path/to/config.ovpn" # or
          #config = "... \n"
          #authUserPass = {
            #username = ; # Default `null`, using this option will put the credentials WORLD-READABLE in the Nix store!
            #password = "";	  
          #};
        #};
      #};
    #};
}
