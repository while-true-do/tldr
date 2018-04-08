#!/bin/bash
#
# Generic test script for Spellchecking markdown files.

# Variables
WTD_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
WTD_COLOR_BLUE='\e[1;34m'
WTD_COLOR_GREEN='\e[1;32m'
WTD_COLOR_RED='\e[1;31m'
WTD_COLOR_OFF='\e[0m'

# Script
printf "$WTD_COLOR_BLUE
**************************************** \n\
***        Spell Checking            *** \n\
**************************************** \n\
$WTD_COLOR_OFF"

BADWORDS=$(sed '/^```/,/^```/d' "$WTD_SCRIPT_DIR/../README.md" | aspell --lang=en --encoding=utf-8\
       	--personal="$WTD_SCRIPT_DIR/.aspell.en.pws" list)

BADWORDS_COUNT=$(echo $BADWORDS | wc -w)

if [ $BADWORDS_COUNT -gt 0 ]; then
  printf "$WTD_COLOR_RED
Error occured - Found $BADWORDS_COUNT bad word(s) \n\
\n\
Bad Words: \n\
$BADWORDS \n\
\n\
**************************************** \n\
$WTD_COLOR_OFF"
  exit 1;
else
  printf "$WTD_COLOR_GREEN
**************************************** \n\
***     Spellchecking successful     *** \n\
**************************************** \n\
  $WTD_COLOR_OFF"
  exit 0;
fi
