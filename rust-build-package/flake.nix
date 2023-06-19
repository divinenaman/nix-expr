{
    inputs={
        nixpkgs.url = "github:nixos/nixpkgs";
        flake-parts.url = "github:hercules-ci/flake-parts";
    };

    outputs=inputs@{ flake-parts, ... }:
        flake-parts.lib.mkFlake { inherit inputs; } {
            flake = let 
                pkgs = nixpkgs.legacyPackages.${system};
                buildInputs = 
                    [ pkgs.cargo 
                    pkgs.rustPlatform.cargoSetupHook
                    pkgs.rustc
                    ];
        	    in { packages.default = 
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
        	        };
            systems = [ "x86_64-linux" ]
        };
}