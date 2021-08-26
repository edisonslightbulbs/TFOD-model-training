#!/bin/bash

# dependencies.sh
#   Helper for installing pip and apt packages
#
# author: Everett
# created: 2021-08-26 07:29
# Github: https://github.com/antiqueeverett/

# source $wd (working directory) variable
cwd="${BASH_SOURCE%/*}"
if [[ ! -d "$cwd" ]]; then cwd="$PWD"; fi
. "$cwd/wd.sh"

# setup vars for apt and pip package lists
apt="$wd/resources/apt.txt"
pip="$wd/resources/pip.txt"

echo "installing apt packages:"
cat "$apt"
echo ""

echo "installing pip packages:"
cat "$pip"
echo ""

# use awk to pre-process each line (i.e., in apt.txt & pip.txt)
# then, hand over each line-output to xargs (approach leaves STDIN unchanged!)
# args:
#      [ -a ] leave STDIN unchanged while reading each line as a  command
#      [ -r ] run iff line not empty
xargs -a <(awk '! /^ *(#|$)/' "$apt") -r -- sudo apt install
# xargs -a <(awk '! /^ *(#|$)/' "$pip") -r -- pip3 uninstall -y
# xargs -a <(awk '! /^ *(#|$)/' "$pip") -r -- pip uninstall -y
xargs -a <(awk '! /^ *(#|$)/' "$pip") -r -- pip install --upgrade
xargs -a <(awk '! /^ *(#|$)/' "$pip") -r -- pip3 install --upgrade
