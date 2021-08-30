#!/bin/bash

# export.sh
#   Exports trained model in tfjs and tflite formats.
#
# author: Everett
# created: 2021-08-27 06:47
# Github: https://github.com/antiqueeverett/

# evaluate working directory
wd="$(dirname "$(dirname "$(readlink -f "$0")")")"

MODEL_DIRECTORY="$wd/models"
TRAINING_DIRECTORY="$wd/models/training"
EXPORT_DIRECTORY="$MODEL_DIRECTORY/export"
TFJS_EXPORT="$EXPORT_DIRECTORY/tfjsexport"
SAVED_MODEL="$EXPORT_DIRECTORY/saved_model"
NODES='detection_boxes,detection_classes,detection_features,detection_multiclass_scores,detection_scores,num_detections,raw_detection_boxes,raw_detection_scores'

PIPELINE_CONFIG="$wd/models/pipeline.config"
TFLITE_EXPORT_SCRIPT="$wd/external/models/research/object_detection/export_tflite_graph_tf2.py"

OUTPUTARRAYS='TFLite_Detection_PostProcess','TFLite_Detection_PostProcess:1','TFLite_Detection_PostProcess:2','TFLite_Detection_PostProcess:3'

tensorflowjs_converter --input_format=tf_saved_model --output_node_names="$NODES" --output_format=tfjs_graph_model --signature_name=serving_default "$SAVED_MODEL" "$TFJS_EXPORT"

python3 "$TFLITE_EXPORT_SCRIPT"  --pipeline_config_path="$PIPELINE_CONFIG" --trained_checkpoint_dir="$MODEL_DIRECTORY" --output_directory="$EXPORT_DIRECTORY"


tflite_convert --saved_model_dir="$EXPORT_DIRECTORY" --output_file="$SAVED_MODEL/detect.tflite" --input_shapes=1,300,300,3 --input_arrays=normalized_input_image_tensor --output_arrays="$OUTPUTARRAYS" --inference_type=FLOAT --allow_custom_ops
