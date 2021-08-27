#!/bin/bash

# pipelineconfig.sh
#   Text-based difference of pretrained-model-pipeline configuration
#    and pipeline configuration of model being trained.
#
# author: Everett
# created: 2021-08-27 12:04
# Github: https://github.com/antiqueeverett/

# evaluate working directory
wd="$(dirname "$(dirname "$(readlink -f "$0")")")"

PRETRAINED_MODEL="ssd_mobilenet_v2_fpnlite_320x320_coco17_tpu-8"
PRETRAINED_MODEL_DIRECTORY="$wd/models/pretrained/$PRETRAINED_MODEL"

MODEL_PIPELINE_CONFIG="$wd/models/pipeline.config"
PRETRAINED_MODEL_PIPELINE_CONFIG="$PRETRAINED_MODEL_DIRECTORY/pipeline.config"

vimdiff "$MODEL_PIPELINE_CONFIG" "$PRETRAINED_MODEL_PIPELINE_CONFIG"
