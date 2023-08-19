{pkgs, ...}: {
  imports = [
    ./emacs.nix
    ./emulation.nix
    ./media.nix
    ./hacking.nix
    ./network.nix
    ./pkgs.nix
    ./shell.nix
    ./xdg.nix
  ];

  # GitHub CLI tool
  programs.gh = {
    enable = true;
  };

  home.packages = with pkgs; [
    # Messaging (from cooler to less cooler)
    signal-desktop #signal-desktop-beta
    telegram-desktop
    discord

    weechat #weechat-unwrapped
    #irssi
    gajim # XMPP client
  ];
}