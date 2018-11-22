#!/bin/bash
#
# Generic test script for finding trailing whitespace.

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
printf "***       %s        ***\\n" "Whitespace Checking"
printf "%s\\n" "$WTD_HR_LINE"
printf "%b" "$WTD_COLOR_OFF"

RESULT=$(find "$WTD_SCRIPT_DIR/../" -path "*/.git" -prune -o -name "*.md" -prune -o -name "*.md.j2" -o -type f -exec grep -nE ".*\\s+$" {} +)
EXIT_CODE=$?

RESULT_MD=$(find "$WTD_SCRIPT_DIR/../" -path "*/.git" -prune -o -regextype sed -regex "\\(.*\\.md\\)\\|\\(.*\\.md\\.j2\\)" -exec grep -nE ".*\\s+$" {} +)
EXIT_CODE_MD=$?

if [ "$EXIT_CODE" -eq 0 ]; then
  printf "\\n"
  printf "%b" "$WTD_COLOR_RED"
  printf "%s\\n" "Error occured - Found trailing whitespace"
  printf "\\n"
  printf "%s\\n" "$RESULT"
  printf "\\n"
  printf "%s" "$WTD_HR_LINE"
  printf "%b" "$WTD_COLOR_OFF"
  if [ "$EXIT_CODE_MD" -eq 0 ]; then
    printf "\\n%s\\n%s\\n" "Please also check the below Markdown files manually:" "$RESULT_MD"
  fi
  exit 1;
else
  printf "\\n"
  printf "%b" "$WTD_COLOR_GREEN"
  printf "%s\\n" "$WTD_HR_LINE"
  printf "***  %s  ***\\n" "Whitespace checking successful"
  printf "%s\\n" "$WTD_HR_LINE"
  printf "%b" "$WTD_COLOR_OFF"
  if [ "$EXIT_CODE_MD" -eq 0 ]; then
    printf "\\n%s\\n%s\\n" "Please also check the below Markdown files manually:" "$RESULT_MD"
  fi
  exit 0;
fi
