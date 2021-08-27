#!/bin/bash

# train.sh
#   Trains object detection model
#
# author: Everett
# created: 2021-08-27 06:22
# Github: https://github.com/antiqueeverett/

# evaluate working directory
wd="$(dirname "$(dirname "$(readlink -f "$0")")")"

TRAINING_STEPS=2000
MODEL_DIRECTORY="$wd/models"
PIPELINE_CONFIG="$wd/models/pipeline.config"
TF_TRAINING_SCRIPT="$wd/external/models/research/object_detection/model_main_tf2.py"

python3 "$TF_TRAINING_SCRIPT" --model_dir="$MODEL_DIRECTORY" --pipeline_config_path="$PIPELINE_CONFIG" --num_train_steps="$TRAINING_STEPS"
