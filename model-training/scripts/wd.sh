#!/usr/bin/env bash

# wd.sh:
#   Evaluates the working directory
#
# author: Everett
# created: 2021-04-15 09:48
# Github: https://github.com/antiqueeverett/

wd="$(dirname "$(dirname "$(readlink -f "$0")")")"
