with import <nixpkgs> {};
    { crate2nix = (import ./Cargo.nix {}).rootCrate.build; }