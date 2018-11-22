#!/bin/bash
#
# Generic test script for Spellchecking markdown files.

# Variables
WTD_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WTD_COLOR_BLUE='\e[1;34m'
WTD_COLOR_GREEN='\e[1;32m'
WTD_COLOR_RED='\e[1;31m'
WTD_COLOR_OFF='\e[0m'
WTD_HR_LINE="****************************************"

# Script
printf "%b" "$WTD_COLOR_BLUE"
printf "%s\\n" "$WTD_HR_LINE"
printf "***          %s          ***\\n" "Spell Checking"
printf "%s\\n" "$WTD_HR_LINE"
printf "%b" "$WTD_COLOR_OFF"

BADWORDS=$(sed -e "/^\`\`\`/,/^\`\`\`/d" -e "s/\`.*\`//g" "$WTD_SCRIPT_DIR/../README.md" | \
  aspell --lang=en --encoding=utf-8 --personal="$WTD_SCRIPT_DIR/.aspell.en.pws" list)

BADWORDS_COUNT=$(echo "$BADWORDS" | wc -w)

if [ "$BADWORDS_COUNT" -gt 0 ]; then
  printf "\\n"
  printf "%b" "$WTD_COLOR_RED"
  printf "%s\\n" \
    "Error occured - Found $BADWORDS_COUNT bad word(s)"
  printf "\\n"
  printf "%s\\n" "Bad Words:"
  printf "%s\\n" "$BADWORDS"
  printf "\\n"
  printf "%s\\n" "$WTD_HR_LINE"
  printf "%b" "$WTD_COLOR_OFF"
  exit 1;
else
  printf "\\n"
  printf "%b" "$WTD_COLOR_GREEN"
  printf "%s\\n" "$WTD_HR_LINE"
  printf "***     %s     ***\\n" "Spellchecking successful"
  printf "%s\\n" "$WTD_HR_LINE"
  printf "%b" "$WTD_COLOR_OFF"
  exit 0;
fi
