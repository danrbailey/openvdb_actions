#!/usr/bin/env bash

set -e

HOUDINI_MAJOR="$1"
GOLD="$2"
HOUDINI_CLIENT_ID="$3"
HOUDINI_SECRET_KEY="$4"

# pip install --user future
# pip install --user lxml
# pip install --user mechanize

pip install --user requests

# export PYTHONPATH=${PYTHONPATH}:/usr/lib/python2.7/dist-packages
# download and unpack latest houdini headers and libraries from daily-builds
# python ci/download_houdini.py $HOUDINI_MAJOR $HOUDINI_CLIENT_ID $HOUDINI_SECRET_KEY

python ci/download_houdini2.py $HOUDINI_MAJOR $GOLD $HOUDINI_CLIENT_ID $HOUDINI_SECRET_KEY

tar -xzf hou.tar.gz
ln -s houdini* hou
cd hou
tar -xzf houdini.tar.gz

cd -
