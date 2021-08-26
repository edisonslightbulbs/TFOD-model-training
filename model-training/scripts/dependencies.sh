#!/bin/bash

# dependencies.sh
#   Helper for installing pip and apt packages
#
# author: Everett
# created: 2021-08-26 07:29
# Github: https://github.com/antiqueeverett/

# use awk to pre-process each line (i.e., in apt.txt & pip.txt)
# then, hand over each line-output to xargs (approach leaves STDIN unchanged!)
# args:
#      [ -a ] leave STDIN unchanged while reading each line as a  command
#      [ -r ] run iff line not empty

sudo apt update

# -- install apt packages
xargs -a <(awk '! /^ *(#|$)/' "packages/apt.txt") -r -- sudo apt-get -y install

# -- pip install
xargs -a <(awk '! /^ *(#|$)/' "packages/npm.txt") -r -- sudo pip3 install
