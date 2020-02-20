#!/usr/bin/env bash

set -e

HOUDINI_MAJOR="$1"
GOLD="$2"
HOUDINI_CLIENT_ID="$3"
HOUDINI_SECRET_KEY="$4"

if [ "$HOUDINI_CLIENT_ID" == "" ]; then
    echo "HOUDINI_CLIENT_ID GitHub Action Secret needs to be set to install Houdini builds"
fi
if [ "$HOUDINI_SECRET_KEY" == "" ]; then
    echo "HOUDINI_SECRET_KEY GitHub Action Secret needs to be set to install Houdini builds"
fi

pip install --user requests

python ci/download_houdini2.py $HOUDINI_MAJOR $GOLD $HOUDINI_CLIENT_ID $HOUDINI_SECRET_KEY

tar -xzf hou.tar.gz
ln -s houdini* hou
cd hou
tar -xzf houdini.tar.gz

cd -
