#!/usr/bin/env bash

# initialize_azure_kinect_sensor_sdk.sh:
#   Initializes the Kinect's SDK project.
#
# author: Everett
# created: 2021-08-24 13:56
# Github: https://github.com/antiqueeverett/

PROJECT_ROOT="$(dirname "$(dirname "$(readlink -f "$0")")")"
echo "-- attempting to initialize K4a SDK"

K4A_SDK="$PROJECT_ROOT/external/Azure-Kinect-Sensor-SDK"
K4A_SDK_BUILD="$PROJECT_ROOT/external/Azure-Kinect-Sensor-SDK/build"

# make sure submodule root and build directories are initialized
if [ -z "$(ls -A "$K4A_SDK")" ]; then
    command git pull --recurse-submodules -j 12
    command git submodule update --init --recursive -j 12
elif [ -z "$(ls -A "$K4A_SDK_BUILD")" ]; then
    ./scripts/build_kinect_sdk.sh -j 12
fi
