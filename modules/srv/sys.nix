{ pkgs-stable, ... }: {

    # Locale
    i18n.supportedLocales = [
        "en_US.UTF-8/UTF-8"
	    "ja_JP.UTF-8/UTF-8"
    ];

    environment.systemPackages = builtins.attrValues {
        inherit (pkgs-stable)
	    ntfs3g;
    };
}
