pkgs:
    with pkgs;
        stdenv.mkDerivation {
            name = "hello-stdenv";
            src = fetchurl {
                url = "https://mirror.downloadvn.com/gnu/hello/hello-2.9.tar.gz";
                sha256 = "sha256-7Lt6IhQZbFf/k0CqcUWOFVmr049tjRaWZoRpNd8ZHqc=";
            };
            postInstall = ''
                "$out/bin/hello" > "$out/run-log"
            '';
        }