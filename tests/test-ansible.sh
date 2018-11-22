#!/bin/bash
#
# Generic test script for ansible roles.

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
printf "***         %s          ***\\n" "Ansible Testing"
printf "%s\\n" "$WTD_HR_LINE"
printf "%b" "$WTD_COLOR_OFF"

printf "*** Step 1: Create valid ansible.cfg ***\\n"
printf '[defaults]\nroles_path=../' > "$WTD_SCRIPT_DIR/../ansible.cfg"
printf "%s\\n" "$WTD_HR_LINE"

printf "*** Step 2: Install Dependencies     ***\\n"
if [ -f "$WTD_SCRIPT_DIR/../requirements.yml" ]; then
  ansible-galaxy install -v -r "$WTD_SCRIPT_DIR/../requirements.yml"
fi
printf "%s\\n" "$WTD_HR_LINE"

printf "*** Step 3: Syntax Check             ***\\n"
ansible-playbook "$WTD_SCRIPT_DIR/test.yml" -i "$WTD_SCRIPT_DIR/inventory" -vv --syntax-check || WTD_ERR=true
printf "%s\\n" "$WTD_HR_LINE"

printf "*** Step 4: Linting                  ***\\n"
ansible-lint -Rv "$WTD_SCRIPT_DIR/test.yml" || WTD_ERR=true
printf "%s\\n" "$WTD_HR_LINE"

printf "*** Step 5: Clean Up                 ***\\n"
rm -v "$WTD_SCRIPT_DIR/../ansible.cfg"
printf "%s\\n" "$WTD_HR_LINE"

if [ $WTD_ERR ]; then
  printf "\\n"
  printf "%b" "$WTD_COLOR_RED"
  printf "%s\\n" "$WTD_HR_LINE"
  printf "***   %s   ***\\n" \
    "Error occured - Tests failed"
  printf "%s\\n" "$WTD_HR_LINE"
  printf "%b" "$WTD_COLOR_OFF"
  exit 1
else
  printf "\\n"
  printf "%b" "$WTD_COLOR_GREEN"
  printf "%s\\n" "$WTD_HR_LINE"
  printf "***         %s         ***\\n" \
    "Tests successful"
  printf "%s\\n" "$WTD_HR_LINE"
  printf "%b" "$WTD_COLOR_OFF"
  exit 0
fi
