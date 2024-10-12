#!/bin/bash

# Change directory to indic_consonants (adjust the path as needed)
cd indic_consonants

# Loop through all the JSON files
for file in *_consonants_seed.json; do
  # Extract the language part by removing everything after the first underscore
  new_name=$(echo "$file" | sed 's/_.*//')

  # Rename the file
  mv "$file" "${new_name}.json"
done

echo "Renaming complete!"
