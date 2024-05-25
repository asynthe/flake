{ lib, ... }: {

    networking.hostName = "thinkpad";
    system.stateVersion = "23.11";
    nixpkgs.config.allowUnfree = lib.mkForce true;
    time.timeZone = "Australia/Perth";

    # Custom configuration
    system.laptop.users.enable = true;
    language.english.enable = true;

    imports = [
        ./hardware.nix
        ./modules.nix

        # Profiles / Custom configurations
        ../../profiles/boot # Just banner for now, lol.
        ../../profiles/locale
        ../../profiles/user
        ../../profiles/vpn
    ];
}
