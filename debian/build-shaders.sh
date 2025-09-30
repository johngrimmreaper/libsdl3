#!/bin/bash
# Adapted from upstream's build-shaders.sh to avoid spirvcross dependency

set -e

make-header() {
    xxd -i "$1" | sed \
        -e 's/^unsigned /const unsigned /g' \
        -e 's,^const,static const,' \
        > "$1.h"
}

for filename in src/render/gpu/shaders/*.hlsl test/*.hlsl; do
    if [ -f "$filename" ]; then
        dir=${filename%/*}
        name=${filename##*/}
        env -C "${dir}" glslangValidator -e main -o "${name/.hlsl/.spv}" -V -D "$name"
        ( cd "${dir}"; make-header "${name/.hlsl/.spv}" )

        # We don't use these on Linux, they just need to exist
        : > "${filename/.hlsl/.msl}"
        ( cd "${dir}"; make-header "${name/.hlsl/.msl}" )
        : > "${filename/.hlsl/.dxil}"
        ( cd "${dir}"; make-header "${name/.hlsl/.dxil}" )
    fi
done
