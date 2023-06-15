# doc: https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/rust.section.md

with import <nixpkgs> {};
    rustPlatform.buildRustPackage {
        pname = "rust-test";
        version = "0.0.1";

        src = ./.;

        cargoLock = {
            lockFile = ./Cargo.lock;
            allowBuiltinFetchGit = true;
        };

        nativeBuildInputs = [
            cargo
            rustPlatform.cargoSetupHook
            rustc
        ];
    }