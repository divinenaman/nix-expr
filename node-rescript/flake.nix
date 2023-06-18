{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs";
        flake-utils.url = "github:numtide/flake-utils";
    };

    outputs = { self, nixpkgs, flake-utils }:
        flake-utils.lib.eachDefaultSystem(system:
            let 
                pkgs = nixpkgs.legacyPackages.${system};
                pkgName = "rescript-test";
                # node16 = pkgs.nodejs_16;
            in {
                packages.${pkgName} = pkgs.buildNpmPackage rec {
                    pname = pkgName;
                    version = "0.0.1";
                    # src = ./.;

                    src = pkgs.fetchFromGitHub {
                        owner = "divinenaman";
                        repo = "confab-video-chat-app";
                    };
                    npmBuildScript = "res:build";
                    npmDespHash = "sha256-ZPSCP7NN+z+bTRun/nC3M2o3lkym8KpAcC+dlyeoopo=
";
                };
                packages.default = self.packages.${system}.${pkgName};
                devShell = pkgs.mkShell {
                    buildInputs = [ pkgs.nodejs ];
                };
            }        
        );
}