{pkgs, ...}: {
  home = {
    sessionPath = [
      "$HOME/.cargo/bin"
    ];
    packages = builtins.attrValues {
      inherit
        (pkgs)
        cargo
        rustc
	#rustup (conflicts with installing cargo)
        #rusty-man
        #surrealdb
        ;
    };
  };
}
