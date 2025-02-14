#!/bin/bash

set -euo pipefail

# Assume sudo in this script
GITHUB_WORKSPACE=${GITHUB_WORKSPACE:-$(pwd)}
BPFTRACE_VERSION=${BPFTRACE_VERSION:-0.22.1}
GCC_VERSION=${GCC_VERSION:-13}

# Install pre-requisites
export DEBIAN_FRONTEND=noninteractive
apt-get update -y
apt-get install -y curl file gawk libfuse2t64 make sudo

# Install CC
apt-get install -y gcc-${GCC_VERSION} g++-${GCC_VERSION}

${GITHUB_WORKSPACE}/.github/scripts/install-bpftrace.sh

