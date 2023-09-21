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
        #rusty-man
        
        #surrealdb
        
        ;
    };
  };
}
