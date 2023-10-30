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

          # arg 1 : directory
          # if $1 not set or null use `.`
          dir=''${1:-.}
          
          # arg 2 : port
          port=''${2:-4000}

          # arg 3 : subdomain
          timestamp=$(date +%s)
          sub=''${3:-"proxver-$timestamp"}

          echo "starting server"
          python -m http.server "$port" --directory "$dir" &
          
          echo "proxing..."
          lt --port "$port" --subdomain "$sub" 
        '';
      };
      devShells.proxver = with pkgs; mkShell {
        inputFrom = [ self'.packages.proxver ];
      };
    };
}
