#!/bin/bash

# Simple package installer using curl or wget
BASE='https://'
SITE="$1"
PKG="$2"

echo "Attempting to fetch $PKG from $SITE"

# Try curl first
if curl -f "$BASE$SITE/$PKG" -o "$PKG.sh"; then
  echo "curl was successful, $PKG was installed."
  exit 0
# If curl fails, try wget
elif wget "$BASE$SITE/$PKG" -O "$PKG.sh"; then
  echo "curl failed, but wget was successful, $PKG was installed."
  exit 0
# If both fail, show error
else
  echo "Error: both curl and wget failed. Check the URL or if curl/wget is installed." >&2
  exit 1
fi
