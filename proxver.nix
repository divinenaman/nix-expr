{ self, ... }:
{
  perSystem = { self', pkgs, ... } : let 
    src = ./.;
    in
    {
      packages.proxver = pkgs.writeShellApplication {
      name = "proxver";
      runtimeInputs = with pkgs; [ python311 ngrok ];
      text = ''
          python -m http.server 4000 --directory ${src} &
          ngrok http --host-header=rewrite 4000
        '';
      };
    };
}
