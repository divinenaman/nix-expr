{
	inputs = {
	  	nixpkgs.url = "github:nixos/nixpkgs";
	  	flake-utils.url = "github:numtide/flake-utils";
	  	flake-parts.url = "github:hercules-ci/flake-parts";
	  
	  	#myhello.url = "./flakes/hello-flake";
	 	#playwright-nix.url = "./flakes/playwright-nix";
	  	#python-app.url = "./python-app";
	};

	outputs = inputs@{ flake-parts, ... }: 
		flake-parts.lib.mkFlake { inherit inputs; } {
			systems = [ "x86_64-linux" "aarch64-darwin" ];
			imports = [ ./proxver.nix ];
			#perSystem = { pkgs, system, ... }: {
			#	packages.default = pkgs.hello;
			#	packages.subflake-myhello = myhello.packages.${system}.hello;
			#	packages.subflake-playwright-test = playwright-nix.packages.${system}.playwright-test;
			#	packages.python-app = python-app.packages.${system}.app;
			#	devShells.python-app = python-app.devShell.${system};
			#};
		};
}
