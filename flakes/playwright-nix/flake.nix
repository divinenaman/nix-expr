{
  description = "e2e-playwright";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";
  };
  outputs = inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;
      perSystem = { self', pkgs, lib, ... }: let
          PLAYWRIGHT_BROWSERS_PATH="${pkgs.playwright-driver.browsers}";
        in
        {
          packages.playwright-test = pkgs.writeShellApplication {
            name = "e2e-playwright";
            runtimeInputs = with pkgs; [ nodejs playwright-test PLAYWRIGHT_BROWSERS_PATH ];
            text = ''
              playwright test --project chromium
            '';
          };

          devShells.default = pkgs.mkShell {
            buildInputs = with pkgs; [
              nodejs
              playwright-test
            ];

            inherit PLAYWRIGHT_BROWSERS_PATH;

            shellHook = ''
              # Remove playwright from node_modules, so it will be taken from playwright-test
              rm node_modules/@playwright/ -R
            '';
          };
        };
    };
}