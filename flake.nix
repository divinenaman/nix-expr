{
	inputs = {
	  nixpkgs.url = "github:nixos/nixpkgs";
	  flake-utils.url = "github:numtide/flake-utils";
	  flake-parts.url = "github:hercules-ci/flake-parts";
	  
	  myhello.url = "path:./flakes/hello-flake";
	};

	outputs = inputs@{ flake-parts, myhello, ... }: 
		flake-parts.lib.mkFlake { inherit inputs; } {
			systems = [ "x86_64-linux" "aarch64-darwin" ];
			imports = [ ./rust-build-package/module.nix ./flake-parts-modules/hello-module.nix ];
			perSystem = { pkgs, system, ... }: {
				packages.default = pkgs.hello;
				packages.myhello = myhello.packages.${system}.hello;
			};
		};
}
