{ self, ... }:
{
  perSystem = { self', pkgs, ... } : let
      localtunnel = pkgs.nodePackages_latest.localtunnel;
    in
    {
      packages.proxver = pkgs.writeShellApplication {
      name = "proxver";
      runtimeInputs = [ pkgs.python311 localtunnel ];
      text = ''
          set -e

          # if $1 not set or null use `.`
          dir=''${1:-.}
          t=$(date +%s)
          sub=''${2:-"proxver-$t"}

          echo "starting server"
          python -m http.server 5000 --directory "$dir" &
          
          echo "proxing..."
          lt --port 5000 --subdomain "$sub" 
        '';
      };
      devShells.proxver = with pkgs; mkShell {
        inputFrom = [ self'.packages.proxver ];
      };
    };
}
