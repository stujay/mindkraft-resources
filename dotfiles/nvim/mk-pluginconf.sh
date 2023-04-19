#!/bin/bash

# create jayconf-imports directory if it doesn't exist
if [ ! -d "jayconf-imports" ]; then
  mkdir jayconf-imports
fi

# read the init.vim file line by line
while read line; do
  if [[ $line =~ ^Plug\ +\'([^\']+)\' ]]; then
    # extract the plugin name from the line
    plugin_name="${BASH_REMATCH[1]}"
    # extract the last part of the plugin name (after the last '/')
    plugin_file=$(echo "$plugin_name" | awk -F '/' '{print $NF}')
    # create a new import file for the plugin if it doesn't exist
    if [ ! -f "jayconf-imports/plug-$plugin_file.vim" ]; then
      touch "jayconf-imports/plug-$plugin_file.vim"
    fi
    # add the source command for the import file to the plugin line
    echo "${line}\nsource ./jayconf-imports/plug-$plugin_file.vim" >> init.vim.new
  else
    # copy non-plugin lines directly to the new init.vim file
    echo "$line" >> init.vim.new
  fi
done < init.vim

# replace the original init.vim file with the new one
mv init.vim.new init.vim
