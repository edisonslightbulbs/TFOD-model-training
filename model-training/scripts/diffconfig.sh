#!/bin/bash

# diffconfig.sh
#   Does text-based diff between pretrained model and trained model
#   pipeline configuration files.
#
# author: Everett
# created: 2021-08-27 05:59
# Github: https://github.com/antiqueeverett/

# evaluate working directory
wd="$(dirname "$(dirname "$(readlink -f "$0")")")"

PRETRAINED_MODEL="ssd_mobilenet_v2_fpnlite_320x320_coco17_tpu-8"
TRAINED_MODEL_PIPELINE_CONFIG="$wd/models/pipeline.config"
PRETRAINED_MODEL_PIPELINE_CONFIG="$wd/models/pretrained/$PRETRAINED_MODEL/pipeline.config"

vimdiff "$TRAINED_MODEL_PIPELINE_CONFIG" "$PRETRAINED_MODEL_PIPELINE_CONFIG"
