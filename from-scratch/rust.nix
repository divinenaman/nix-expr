pkgs: 
    with pkgs;
        derivation {
            name = "rust-test";
            builder = "${bash}/bin/bash";
            args = [ ./builder-rust.sh ];
            setup = ./setup.sh;
            src = ./hello.rs;
            baseInputs = [ coreutils gcc rustc ];
            system = builtins.currentSystem;
        }