{ self, lib, ... }:
    {
        perSystem = { config, self', inputs', pkgs, ... }: let
                buildInputs = 
                    [ pkgs.cargo 
                      pkgs.rustPlatform.cargoSetupHook
                      pkgs.rustc
                    ];
                in 
                {   packages.rust-build-package = 
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

            	    devShells.rust-build-package = pkgs.mkShell { inherit buildInputs; };
        	    };      
    }