{ self, ... }: 
	{
		perSystem = { self', pkgs, ... } : let
          PLAYWRIGHT_BROWSERS_PATH="${pkgs.playwright-driver.browsers}";
        in
        {
          packages.playwright-test = pkgs.writeShellApplication {
            name = "e2e-playwright";
            runtimeInputs = with pkgs; [ nodejs playwright-test PLAYWRIGHT_BROWSERS_PATH ];
            text = ''
              cd flakes/playwright-nix
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
	}
	