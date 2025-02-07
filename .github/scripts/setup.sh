#!/bin/bash

set -euo pipefail

# Assume sudo in this script
BPFTRACE_VERSION=${BPFTRACE_VERSION:-0.22.1}
GCC_VERSION=${GCC_VERSION:-13}

# Install pre-requisites
export DEBIAN_FRONTEND=noninteractive
apt-get update -y
apt-get install -y curl file gawk libfuse2t64 make sudo

# Install CC
apt-get install -y gcc-${GCC_VERSION} g++-${GCC_VERSION}

# Download bpftrace release
BIN_DIR=/usr/local/bin
mkdir -p $BIN_DIR
curl -L -o bpftrace https://github.com/bpftrace/bpftrace/releases/download/v${BPFTRACE_VERSION}/bpftrace
chmod +x bpftrace
mv bpftrace $BIN_DIR
bpftrace --version

# mount tracefs to avoid warnings from bpftrace
grep -q tracefs /proc/mounts || mount -t tracefs tracefs /sys/kernel/tracing
