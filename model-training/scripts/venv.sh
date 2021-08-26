#!/bin/bash

# source $wd (working directory) variable
cwd="${BASH_SOURCE%/*}"
if [[ ! -d "$cwd" ]]; then cwd="$PWD"; fi
. "$cwd/wd.sh"

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
