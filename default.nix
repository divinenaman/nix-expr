let 
    pkgs = import <nixpkgs> {};
in
{
    rust-scratch = import ./from-scratch/rust.nix pkgs;
    hello-stdenv = import ./using-stdenv/hello-gnu.nix pkgs;
    hello-mkshell = import ./using-stdenv/hello-mkshell.nix pkgs;
}
