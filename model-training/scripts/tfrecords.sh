#!/bin/bash

# tfrecords.sh
#   Creates TF records using image annotations
#
# author: Everett
# created: 2021-08-27 06:15
# Github: https://github.com/antiqueeverett/

# evaluate working directory
wd="$(dirname "$(dirname "$(readlink -f "$0")")")"

TF_RECORDS_SCRIPT="$wd/scripts/tfrecords.py"
ANNOTATIONS="$wd/annotations/annotations.pbtxt"

TRAINING_IMAGES="$wd/resources/images/train"
TRAINING_RECORD="$wd/records/train.record"

TESTING_IMAGES="$wd/resources/images/test"
TESTING_RECORD="$wd/records/test.record"

rm -rf "$wd/records/*.record"  >/dev/null 2>&1
echo "-- creating TF records using image annotations"

python3 "$TF_RECORDS_SCRIPT" -x "$TRAINING_IMAGES" -l "$ANNOTATIONS" -o "$TRAINING_RECORD"
python3 "$TF_RECORDS_SCRIPT" -x "$TESTING_IMAGES" -l "$ANNOTATIONS"  -o "$TESTING_RECORD"
