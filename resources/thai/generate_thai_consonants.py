#!/bin/bash

# Input and Output Paths
INPUT_FILE="thai.json"
OUTPUT_DIR="indic_consonants"
OUTPUT_FILE="$OUTPUT_DIR/thai_ascii.json"

# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Use jq to add the ascii_name field to each consonant based on the symbol
jq '
  .consonants |= map(
    .ascii_name = 
      if .symbol == "ก" then "ka"
      elif .symbol == "ข" then "kha"
      elif .symbol == "ค" then "ga"
      elif .symbol == "ฆ" then "gha"
      elif .symbol == "ง" then "nga"
      elif .symbol == "จ" then "ca"
      elif .symbol == "ฉ" then "cha"
      elif .symbol == "ช" then "ja"
      elif .symbol == "ซ" then "jha"
      elif .symbol == "ญ" then "nya"
      elif .symbol == "ฎ" then "tta"
      elif .symbol == "ฏ" then "ttha"
      elif .symbol == "ฐ" then "dda"
      elif .symbol == "ฑ" then "ddha"
      elif .symbol == "ณ" then "nna"
      elif .symbol == "ด" then "ta"
      elif .symbol == "ต" then "tha"
      elif .symbol == "ถ" then "da"
      elif .symbol == "ท" then "dha"
      elif .symbol == "น" then "na"
      elif .symbol == "บ" then "pa"
      elif .symbol == "ป" then "pha"
      elif .symbol == "ผ" then "ba"
      elif .symbol == "ฝ" then "bha"
      elif .symbol == "พ" then "ma"
      elif .symbol == "ย" then "ya"
      elif .symbol == "ร" then "ra"
      elif .symbol == "ล" then "la"
      elif .symbol == "ว" then "va"
      elif .symbol == "ศ" then "sha"
      elif .symbol == "ษ" then "ssha"
      elif .symbol == "ส" then "sa"
      elif .symbol == "ห" then "ha"
      elif .symbol == "อ" then "?"
      elif .symbol == "ฬ" then "ll"
      else .ascii_name
      end
  )
' "$INPUT_FILE" > "$OUTPUT_FILE"

echo "Updated thai.json with ascii_name field has been exported to $OUTPUT_FILE"

