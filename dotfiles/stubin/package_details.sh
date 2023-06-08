#!/bin/bash

# package_details.sh

function display_package_details() {
    package_name="$1"
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        apt show "$package_name"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        brew info "$package_name"
    fi
}
