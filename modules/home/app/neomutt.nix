{ config, ... }: {

  home.packages = builtins.attrValues {
    inherit
      (pkgs)

      #neomutt
      #mutt
      #mutt-wizard # cli email client
      #isync
      #msmtp
      #notmuch
      #notmuch-mutt
      #abook
      #urlview
      #links2
      #lynx
      #nyxt
      #imap #mpop # popmail email service like popmail

      ;
  };
}
