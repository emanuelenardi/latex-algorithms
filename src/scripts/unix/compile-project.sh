#!/bin/bash
source "${BASH_SOURCE%/*}/common.sh"

INITIAL_WORKING_DIRECTORY=$(pwd)

# GITHUB_ACTIONS: Always set to true when GitHub Actions is running the workflow.
# You can use this variable to differentiate when tests are being run locally or by GitHub Actions.
if [[ -z "$GITHUB_ACTIONS" ]] ; then
  source "${BASH_SOURCE%/*}/reset-project.sh"
else
  : # no-op command
fi

source "${BASH_SOURCE%/*}/compile-preambles.sh"
source "${BASH_SOURCE%/*}/compile-chapters.sh"
source "${BASH_SOURCE%/*}/compile-main.sh"

cd $INITIAL_WORKING_DIRECTORY