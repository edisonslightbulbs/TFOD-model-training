#!/bin/bash

# venv.sh
#   Sets up a virtual environment with ipykernel
#
# author: Everett
# created: 2021-08-27 06:22
# Github: https://github.com/antiqueeverett/

# evaluate working directory
wd="$(dirname "$(dirname "$(readlink -f "$0")")")"

# change to working directory
cd "$wd" || return

# create virtual environment iff non exists
venv="tfod-venv"

if [ -d "$venv" ]; then
    echo "found $venv (seems like one was already created)"
else
    if python3 -m venv "$venv"; then
        source "$venv/bin/activate"
        "$wd/scripts/dependencies.sh"
        python3 -m ipykernel install --user --name="$venv"
    else
        echo "failed to correctly create virtual environment"
    fi
fi
