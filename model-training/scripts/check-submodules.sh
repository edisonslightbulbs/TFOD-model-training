#!/bin/bash

# check-submodules.sh
#   Helper that checks require submodule repositories
#
# author: Everett
# created: 2021-08-26 11:34
# Github: https://github.com/antiqueeverett/

# source $wd (working directory) variable
cwd="${BASH_SOURCE%/*}"
if [[ ! -d "$cwd" ]]; then cwd="$PWD"; fi
. "$cwd/wd.sh"

# make sure submodules are initialized
ANNOTATION_TOOL="$wd/external/labelImg"
TENSORFLOW_MODELS="$wd/external/models"

# Initialize iff submodule dir empty
if [ -z "$(ls -A "$ANNOTATION_TOOL")" ]; then
    command git pull --recurse-submodules -j 12
    command git submodule update --init --recursive -j 12
fi

# Initialize iff submodule dir empty
if [ -z "$(ls -A "$TENSORFLOW_MODELS")" ]; then
    command git pull --recurse-submodules -j 12
    command git submodule update --init --recursive -j 12
fi
