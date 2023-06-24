let 
pkgs = import <nixpkgs> {};
in {
	imports = [ ./hello.nix ];
}