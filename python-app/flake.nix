{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs";
        flake-utils.url = "github:numtide/flake-utils";
    };

    outputs = { self, nixpkgs, flake-utils }:

        flake-utils.lib.eachDefaultSystem(system: 
            let 
                pkgs = nixpkgs.legacyPackages.${system};
                src = ./.;
            in {

                devShell = pkgs.mkShell {
                    buildInputs = [ pkgs.python310 ];
                };

                packages.app = pkgs.writeShellApplication {
                    name = "py-app";
                    runtimeInputs = [ pkgs.python310 ];
                    text = ''
                        python ${src}/app.py 
                    '';
                };
            }
        );
}