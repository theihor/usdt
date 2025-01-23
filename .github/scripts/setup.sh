#!/bin/bash

set -euo pipefail

BPFTRACE_VERSION=${BPFTRACE_VERSION:-0.22.1}

# Assume sudo in this script

# Install dependencies
apt update && apt install -y make file gawk libfuse2t64

# Download bpftrace release
BIN_DIR=/usr/local/bin
mkdir -p $BIN_DIR
curl -L -o bpftrace https://github.com/bpftrace/bpftrace/releases/download/v${BPFTRACE_VERSION}/bpftrace
chmod +x bpftrace
mv bpftrace $BIN_DIR
bpftrace --version

# mount tracefs to avoid warnings from bpftrace
grep -q tracefs /proc/mounts || mount -t tracefs tracefs /sys/kernel/tracing
