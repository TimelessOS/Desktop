#!/bin/bash

set -eux

# Install MKOSI
MKOSI_DIR="/tmp/mkosi"
if [ ! -d "$MKOSI_DIR" ]; then
	mkdir -p "$MKOSI_DIR"
	git clone https://github.com/systemd/mkosi "$MKOSI_DIR"
fi

# Clear old builds
"$MKOSI_DIR/bin/mkosi" clean

# Build
time "$MKOSI_DIR/bin/mkosi" \
	--compress-output=zstd \
	--source-date-epoch=0 \
	--force \
	--checksum=true
# Most of these args are just reproducability.
