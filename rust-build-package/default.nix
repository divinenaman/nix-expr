with import <nixpkgs> {};
    rustPlatform.buildRustPackage {
        pname = "rust-test";
        version = "0.0.1";

        src = ./.;

        cargoLock = {
            lockFile = ./Cargo.lock;
        };

        nativeBuildInputs = [
            cargo
            rustPlatform.cargoSetupHook
            rustc
        ];
    }