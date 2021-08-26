#!/bin/bash

# source $wd (working directory) variable
cwd="${BASH_SOURCE%/*}"
if [[ ! -d "$cwd" ]]; then cwd="$PWD"; fi
. "$cwd/wd.sh"

# object detection resources
TENSORFLOW_RESEARCH="$wd/external/models/research"
PROTOCOL_BUFFERS="./object_detection/protos"
PACKAGE_SETUP_SCRIPT="./object_detection/packages/tf2/setup.py"
VERIFICATION_SCRIPT="./object_detection/builders/model_builder_tf2_test.py"

cd "$TENSORFLOW_RESEARCH" || true
protoc "$PROTOCOL_BUFFERS/"*.proto --python_out=.
cp "$PACKAGE_SETUP_SCRIPT" ./
python3 -m pip install .
python3 "$VERIFICATION_SCRIPT"
