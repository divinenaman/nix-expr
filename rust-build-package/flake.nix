{
    inputs={
        nixpkgs.url = "github:nixos/nixpkgs";
        flake-utils.url = "github:numtide/flake-utils";
    };

    outputs={ self, nixpkgs, flake-utils }:
        flake-utils.lib.eachDefaultSystem (system:
		let pkgs = nixpkgs.legacyPackages.${system};
            buildInputs = 
                [ pkgs.cargo 
                  pkgs.rustPlatform.cargoSetupHook
                  pkgs.rustc
                ];
        	in {
            		packages.default = 
                        pkgs.rustPlatform.buildRustPackage {
                            pname = "rust-test";
                            version = "0.0.1";

                            src = ./.;

                            cargoLock = {
                                lockFile = ./Cargo.lock;
                                allowBuiltinFetchGit = true;
                            };

                            nativeBuildInputs = buildInputs;
                        };

            		devShell = pkgs.mkShell { inherit buildInputs; };
        	  }
		);
}