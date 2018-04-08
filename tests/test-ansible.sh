#!/bin/bash
#
# Generic test script for ansible roles.

# Variables
WTD_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
WTD_COLOR_BLUE='\e[1;34m'
WTD_COLOR_GREEN='\e[1;32m'
WTD_COLOR_RED='\e[1;31m'
WTD_COLOR_OFF='\e[0m'

# Script
printf "$WTD_COLOR_BLUE
**************************************** \n\
***        Ansible Testing           *** \n\
**************************************** \n\
$WTD_COLOR_OFF"

printf "*** Step 1: Create valid ansible.cfg *** \n"
printf '[defaults]\nroles_path=../' > "$WTD_SCRIPT_DIR/../ansible.cfg"
printf "**************************************** \n"

printf "*** Step 2: Install Dependencies     *** \n"
if [ -f $WTD_SCRIPT_DIR/../requirements.yml ]; then
  ansible-galaxy install -v -r "$WTD_SCRIPT_DIR/../requirements.yml"
fi
printf "**************************************** \n"

printf "*** Step 3: Syntax Check             *** \n"
ansible-playbook "$WTD_SCRIPT_DIR/test.yml" -i "$WTD_SCRIPT_DIR/inventory" -vv --syntax-check || WTD_ERR=true
printf "**************************************** \n"

printf "*** Step 4: Linting                  *** \n"
ansible-lint -Rv "$WTD_SCRIPT_DIR/test.yml" || WTD_ERR=true
printf "**************************************** \n"

printf "*** Step 5: Clean Up                 *** \n"
rm -v "$WTD_SCRIPT_DIR/../ansible.cfg"
printf "**************************************** \n"

if [ $WTD_ERR ]; then
  printf "$WTD_COLOR_RED
**************************************** \n\
***   Error occured - Tests failed   *** \n\
**************************************** \n\
  $WTD_COLOR_OFF"
  exit 1
else
  printf "$WTD_COLOR_GREEN
**************************************** \n\
***        Tests successful          *** \n\
**************************************** \n\
  $WTD_COLOR_OFF"
  exit 0
fi
