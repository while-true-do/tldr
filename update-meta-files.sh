#!/bin/bash
#
# Description:
#   update-skeleton.sh is a very minimal script to update the skeleton with
#   some additional content from while-true-do.org. It will not remove files,
#   you created. Replacement must be acknowledged.

function usage {
echo "####################################################"
echo "Usage:"
echo "  update-meta-files.sh [a|d|m|s|t]"
echo ""
echo "  no option => Update all, but Meta Files"
echo "  a         => Update all Files"
echo "  d         => Update Doc Files"
echo "  m         => Update Meta Files"
echo "  t         => Update the Test Files"
echo "  s         => Update the Script itself"
echo ""
echo "####################################################"
}

# Variables
WTD_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

WTD_DOC_PATH="https://raw.githubusercontent.com/while-true-do/community/master/docs"
WTD_DOC_FILES=("COMMIT_TEMPLATE.md" "CONTRIBUTING.md" "ISSUE_TEMPLATE.md" "PULL_REQUEST_TEMPLATE.md" "CODE_OF_CONDUCT.md")

# FIXME: Repo for meta files?
WTD_META_PATH="https://raw.githubusercontent.com/while-true-do/ansible-galaxy-skeleton/master/dist/"
WTD_META_FILES=(".editorconfig" ".gitignore" "LICENSE")

# FIXME: Repo for test suite needed?
WTD_TEST_PATH="https://raw.githubusercontent.com/while-true-do/ansible-galaxy-skeleton/master/dist/tests/"
WTD_TEST_FILES=(".aspell.en.pws" "test-ansible.sh" "test-spelling.sh" "test-whitespace.sh")

# Functions

function update_docs {
  echo "Updating Doc Files"
  echo "----------------------"
  if [ ! -d "$WTD_SCRIPT_DIR/docs" ]; then
    mkdir -p "$WTD_SCRIPT_DIR/docs"
  fi

  for i in "${WTD_DOC_FILES[@]}"; do
    echo "Downloading $i"
    curl "$WTD_DOC_PATH/$i" > "$WTD_SCRIPT_DIR/docs/$i"
  done
}

function update_tests {
  echo "Updating Test Files"
  echo "----------------------"

  if [ ! -d "$WTD_SCRIPT_DIR/tests" ]; then
    mkdir -p "$WTD_SCRIPT_DIR/tests"
  fi

  for i in "${WTD_TEST_FILES[@]}"; do
    echo "Downloading $i"
    curl "$WTD_TEST_PATH/$i" > "$WTD_SCRIPT_DIR/tests/$i"
  done
}

function update_metas {
  echo "Updating Meta Files"
  echo "----------------------"

  for i in "${WTD_META_FILES[@]}"; do
    echo "Downloading $i"
    curl "$WTD_META_PATH/$i" > "$WTD_SCRIPT_DIR/$i"
  done
}

function update_self {
  echo "Updating Script"
  echo "----------------------"

  curl "https://raw.githubusercontent.com/while-true-do/ansible-galaxy-skeleton/master/dist/update-meta-files.sh" > "$WTD_SCRIPT_DIR/update-meta-files-new.sh"
  rm -rf "$WTD_SCRIPT_DIR/update-meta-files.sh"
  mv "$WTD_SCRIPT_DIR/update-meta-files-new.sh" "$WTD_SCRIPT_DIR/update-meta-files.sh"
}

function update_all {
  update_docs
  update_tests
  update_metas
  update_self
}

while getopts 'admst' opts; do

  case "${opts}" in
    a) update_all ;;
    d) update_docs ;;
    m) update_metas ;;
    t) update_tests ;;
    s) update_self ;;
    \?) usage ;;
    *) usage ;;
  esac
done
