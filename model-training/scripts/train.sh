#!/bin/bash

# source $wd (working directory) variable
cwd="${BASH_SOURCE%/*}"
if [[ ! -d "$cwd" ]]; then cwd="$PWD"; fi
. "$cwd/wd.sh"

TRAINING_STEPS=2000
MODEL_DIRECTORY="$wd/models"
PIPELINE_CONFIG="$wd/models/pipeline.config"
TF_TRAINING_SCRIPT="$wd/external/models/research/object_detection/model_main_tf2.py"

python3 "$TF_TRAINING_SCRIPT" --model_dir="$MODEL_DIRECTORY" --pipeline_config_path="$PIPELINE_CONFIG" --num_train_steps="$TRAINING_STEPS"
