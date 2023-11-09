#!/usr/bin/env bash

set -o xtrace -o nounset -o pipefail -o errexit


### Assert licenses are available
cargo-bundle-licenses --format yaml --output THIRDPARTY.yml

# build statically linked binary with Rust
cargo install --locked --root "$PREFIX" --path ./rage


# strip debug symbols
"$STRIP" "$PREFIX/bin/rage"

# remove extra build file
rm -f "${PREFIX}/.crates.toml"
