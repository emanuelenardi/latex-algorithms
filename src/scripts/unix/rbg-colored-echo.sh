#!/bin/bash
#
## @file                rgb-colored-echo.sh
## @author              Amber Jain
## @section DESCRIPTION	A bash pretty print script which provides red/green/blue colored echo functions
## @section LICENSE     ISC


#################
# Documentation #
#################
#
# A bash pretty print script which provides following red/green/blue colored echo functions:
#     red_echo
#     simple_red_echo
#     green_echo
#     simple_green_echo
#     blue_echo
#     simple_blue_echo

SELF_NAME=$(basename $0)

RESET_COLOR="\x1b[0m"
BLACK_COLOR='\x1b[1;30m'
RED_COLOR='\x1b[1;31m'
GREEN_COLOR='\x1b[1;32m'
YELLOW_COLOR='\x1b[1;33m'
BLUE_COLOR='\x1b[1;34m'
PURPLE_COLOR='\x1b[1;35m'
CYAN_COLOR='\x1b[1;36m'
GREY_COLOR='\x1b[1;37m'

# Prints warning/error $MESSAGE in red foreground color
#
# For e.g. You can use the convention of using RED color for [E]rror messages
red_echo() {
  echo -e "${RED_COLOR}[E] $SELF_NAME: $MESSAGE${RESET_COLOR}"
}

simple_red_echo() {
  echo -e "${RED_COLOR}$MESSAGE${RESET_COLOR}"
}

# Prints success/info $MESSAGE in green foreground color
#
# For e.g. You can use the convention of using GREEN color for [S]uccess messages
green_echo() {
  echo -e "${GREEN_COLOR}[S] $SELF_NAME: $MESSAGE${RESET_COLOR}"
}

simple_green_echo() {
  echo -e "${GREEN_COLOR}$MESSAGE${RESET_COLOR}"
}

# Prints $MESSAGE in blue foreground color
#
# For e.g. You can use the convetion of using BLUE color for [I]nfo messages
# that require special user attention (especially when script requires input from user to continue)
blue_echo() {
  echo -e "${BLUE_COLOR}[I] $SELF_NAME: $MESSAGE${RESET_COLOR}"
}

simple_blue_echo() {
  echo -e "${BLUE_COLOR}$MESSAGE${RESET_COLOR}"
}