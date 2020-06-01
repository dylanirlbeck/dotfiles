#!/usr/bin/env bash

echo "Read through this file first. Hit ctrl+c now."
read -n 1

## TODO investigate using a Brewfile
# brew bundle

echo 'Symlink setup'
source ./install

echo 'Package and app downloads'
source scripts/bootstrap.sh

echo 'MacOS Setup'
source scripts/setup_mac.sh

echo 'Dock Setup'
source scripts/dock.sh

echo "Done. Reload your terminal!"
