{ config, ... }: {

    home.username = "missingno";
    home.stateVersion = "24.05";
    #networking.hostName = "kali-wsl"; # Not applicable here lol.
    #i18n.defaultLocale = "en_US.UTF-8"; # Not applicable here lol.
    #time.timeZone = "Australia/Perth"; # Not applicable here lol.

    imports = [

        ./home.nix
        ./modules.nix

    ];
}
