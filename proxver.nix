{ self, ... }:
{
  perSystem = { self', pkgs, ... } :
    {
      packages.proxver = pkgs.writeShellApplication {
      name = "proxver";
      runtimeInputs = with pkgs; [ python311 ngrok ];
      text = ''
          python -m http.server 4000 &
          ngrok http --host-header=rewrite 4000
        '';
      };
      devShells.proxver = with pkgs; mkShell {
        inputFrom = [ self'.packages.proxver ];
      };
    };
}
