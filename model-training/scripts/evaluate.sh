#!/bin/bash

# source $wd (working directory) variable
cwd="${BASH_SOURCE%/*}"
if [[ ! -d "$cwd" ]]; then cwd="$PWD"; fi
. "$cwd/wd.sh"

MODEL_DIRECTORY="$wd/models"
PIPELINE_CONFIG="$wd/models/pipeline.config"
TF_TRAINING_SCRIPT="$wd/external/models/research/object_detection/model_main_tf2.py"

python3 "$TF_TRAINING_SCRIPT" --model_dir="$MODEL_DIRECTORY" --pipeline_config_path="$PIPELINE_CONFIG" --checkpoint_dir="$MODEL_DIRECTORY"
