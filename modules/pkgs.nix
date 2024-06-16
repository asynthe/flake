{ pkgs, ... }: {

    environment.systemPackages = builtins.attrValues {
        inherit (pkgs)

            # Programs
            librewolf 
            #ungoogled-chromium
            #tor-browser
      ;
  };
}
