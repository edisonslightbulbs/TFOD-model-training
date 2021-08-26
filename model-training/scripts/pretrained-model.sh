#!/bin/bash

# source $wd (working directory) variable
cwd="${BASH_SOURCE%/*}"
if [[ ! -d "$cwd" ]]; then cwd="$PWD"; fi
. "$cwd/wd.sh"

model="ssd_mobilenet_v2_fpnlite_320x320_coco17_tpu-8.tar.gz"
url="http://download.tensorflow.org/models/object_detection/tf2/20200711/$model"

cd "$wd/models/pretrained"
wget "$url"
tar -zxvf "$model"
