{
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs";
		flake-parts.url = "github:hercules-ci/flake-parts";
	};
	outputs = inputs@{ flake-parts, ... }:
		flake-parts.lib.mkFlake { inherit inputs; } {
			systems = [ "x86_64-linux" "aarch64-darwin" ];
			imports = [ ./hello-module.nix ];
		};
}