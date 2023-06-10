source $setup
set -e

mkdir -p $out/bin

compile() {
    rustc -o $1 $2
}

run() {
    $1 > $2
}

compile $out/bin/hello $src
run $out/bin/hello $out/log