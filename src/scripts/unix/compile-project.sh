#!/bin/bash
source "${BASH_SOURCE%/*}/common.sh"

INITIAL_WORKING_DIRECTORY=$(pwd)

if [[ -z "$GITHUB_ACTIONS" ]] ; then
  source "${BASH_SOURCE%/*}/reset-project.sh"
fi

source "${BASH_SOURCE%/*}/compile-preambles.sh"
source "${BASH_SOURCE%/*}/compile-chapters.sh"
source "${BASH_SOURCE%/*}/compile-main.sh"

cd $INITIAL_WORKING_DIRECTORY