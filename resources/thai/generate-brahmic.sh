#!/bin/bash

# Input and output file
input_file="brahmi-comparison.tsv"
output_file="brahmi-comparison.json"

# Function to convert a name to snake_case
to_snake_case() {
  echo "$1" | tr '[:upper:]' '[:lower:]' | sed 's/[[:space:]]/_/g'
}

# First, read the header line (first line) to get the keys
header=$(head -n 1 "$input_file")

# Create an array of keys from the header, removing the suffix after the underscore
IFS=$'\t' read -r -a keys <<< "$header"
for i in "${!keys[@]}"; do
    keys[$i]=$(echo "${keys[$i]}" | sed 's/_.*//')  # Remove everything after the first underscore
done

# Initialize the JSON output
echo "[" > "$output_file"

# Read the TSV file, line by line (skip the header)
tail -n +2 "$input_file" | while IFS=$'\t' read -r -a line; do
    # Convert the 'name' field into an 'id' field in snake_case
    id=$(to_snake_case "${line[1]}")

    # Start a JSON object for each line
    echo "  {" >> "$output_file"
    echo "    \"id\": \"$id\"," >> "$output_file"
    echo "    \"name\": \"${line[1]}\"," >> "$output_file"

    # Loop over the fields and keys (skip the first two, 'id' and 'name')
    for i in "${!keys[@]}"; do
        if [ "$i" -ge 2 ]; then
            # Split multiple characters into an array (comma-separated)
            values=$(echo "${line[$i]}" | sed 's/ \[.*\]//g' | tr ',' '\n' | sed 's/^\s*//g' | sed 's/\s*$//g' | jq -R . | jq -s .)
            
            # If not the last key, add a comma, otherwise, skip the comma
            if [ "$i" -lt "$((${#keys[@]} - 1))" ]; then
                echo "    \"${keys[$i]}\": $values," >> "$output_file"
            else
                echo "    \"${keys[$i]}\": $values" >> "$output_file"
            fi
        fi
    done

    # Close the JSON object (add a comma if it's not the last line)
    if [ "$(tail -n 1 "$input_file")" != "$line" ]; then
        echo "  }," >> "$output_file"
    else
        echo "  }" >> "$output_file"
    fi
done

# Close the JSON array
echo "]" >> "$output_file"

echo "Conversion complete. JSON written to $output_file"

