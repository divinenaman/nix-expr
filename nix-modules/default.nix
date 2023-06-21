let 
pkgs = import <nixpkgs> {};
in {
	imports = [ ./home.nix ];
	configs = {
		pkgName = "naman";
	};
	#inherit home;
}