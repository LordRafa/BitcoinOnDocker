#!/bin/bash

rm -f "$HOME/bin/bitcoin-onDocker.sh"
rm -f "$HOME/.local/share/icons/hicolor/scalable/apps/bitcoin-onDocker.svg"
rm -f "$HOME/.local/share/applications/bitcoin-onDocker.desktop"
rm -rf "$HOME/.onDocker/bitcoin"

docker image rm lordrafa/bitcoin