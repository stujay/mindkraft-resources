#!/bin/bash

# Function to check if the script is running on macOS
function check_os() {
  if [[ "$(uname)" != "Darwin" ]]; then
    echo "Sorry, this only works on Mac"
    exit 1
  fi
}

# Function to display available languages and get user input
function select_language() {
  echo "Available languages: ar (Arabic), bg (Bulgarian), ca (Catalan), cs (Czech), da (Danish), de (German), el (Greek), en (English), es (Spanish), fi (Finnish), fr (French), he (Hebrew), hi (Hindi), hr (Croatian), hu (Hungarian), id (Indonesian), it (Italian), ja (Japanese), ko (Korean), ms (Malay), nb (Norwegian), nl (Dutch), pl (Polish), pt (Portuguese), ro (Romanian), ru (Russian), sk (Slovak), sv (Swedish), th (Thai), tr (Turkish), uk (Ukrainian), vi (Vietnamese), zh (Chinese)"
  read -p "Enter a two-letter language code: " lang_code
}

# Function to get the list of available voices and filter by language code
function filter_voices() {
  lang_code_lower=$(echo "$lang_code" | tr '[:upper:]' '[:lower:]')
  say -v \? | awk -v lang="$lang_code_lower" '
  {
    if (tolower(substr($2, 1, 2)) == lang) {
      print NR "\t" $1 "\t" $2
    }
  }'
}

# Main script execution
check_os
select_language
filter_voices

