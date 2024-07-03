{ config, pkgs, ... }: {

    # Setting up a new user.
    # Check the manual at:
    # https://nix-community.github.io/NixOS-WSL/how-to/change-username.html
    wsl.defaultUser = "missingno";
}
