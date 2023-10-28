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
	rustup
        #rusty-man
        #surrealdb
        ;
    };
  };
}
