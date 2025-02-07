#!/bin/bash

set -euo pipefail

GCC_VERSION=${GCC_VERSION:-13}
SHARED=${SHARED:-0}

export CC=gcc-${GCC_VERSION}
export CXX=g++-${GCC_VERSION}
export AR=gcc-ar-${GCC_VERSION}

make -C tests clean
make SHARED=${SHARED} -C tests -j$(nproc) build
