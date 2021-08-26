#!/bin/bash

# source $wd (working directory) variable
cwd="${BASH_SOURCE%/*}"
if [[ ! -d "$cwd" ]]; then cwd="$PWD"; fi
. "$cwd/wd.sh"

TF_RECORDS_SCRIPT="$wd/scripts/tfrecords.py"
ANNOTATIONS="$wd/annotations/annotations.pbtxt"

TRAINING_IMAGES="$wd/resources/images/train"
TRAINING_RECORD="$wd/records/train.record"

TESTING_IMAGES="$wd/resources/images/test"
TESTING_RECORD="$wd/records/test.record"

python3 "$TF_RECORDS_SCRIPT" -x "$TRAINING_IMAGES" -l "$ANNOTATIONS" -o "$TRAINING_RECORD"
python3 "$TF_RECORDS_SCRIPT" -x "$TESTING_IMAGES" -l "$ANNOTATIONS"  -o "$TESTING_RECORD"
