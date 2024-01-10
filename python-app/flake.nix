{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs";
        flake-utils.url = "github:numtide/flake-utils";
    };

    outputs = { self, nixpkgs, flake-utils }: {

        flake-utils.eachDefaultSystem(sys: 
            let 
                pkgs = nixpkgs.${system};
            in {

                devShell = pkgs.mkShell {
                    buildInputs = [ pkgs.python310 ];
                }

                packages.python-app = pkgs.writeShellApplication {
                    name = "py-app";
                    runtimeInputs = [ pkgs.python310 ];
                    text = ''
                        python test --project chromium
                    '';
                };
            }
        );

    };
}