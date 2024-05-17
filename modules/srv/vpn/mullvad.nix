{ pkgs, ... }: {

    # pkgs.mullvad only provides the CLI tool.
    # pkgs.mullvad-vpn provices both CLI and GUI.

    services.mullvad-vpn = {
        enable = true;
        package = pkgs.mullvad;
    };
}
