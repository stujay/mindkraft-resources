#!/bin/bash

# Define the input file paths
DEVANAGARI_INPUT="devanagari-wikipedia.json"
DEVANAGARI_OUTPUT="./indic_consonants/devanagari.json"

# Ensure the output directory exists
mkdir -p ./indic_consonants

# jq command to process and transform the devanagari data
jq '{
  script: {
    name: "Devanagari",
    iso: "Deva",
    tonal: false,
    varga_mapping: {
      original_vargas: [
        "guttural",
        "palatal",
        "cerebral",
        "dental",
        "labial"
      ],
      current_vargas: [
        "guttural",
        "palatal",
        "cerebral",
        "dental",
        "labial"
      ]
    },
    action_mapping: {
      original_actions: [
        "stopped",
        "aspirated",
        "voiced",
        "voiced-aspirated",
        "nasal",
        "semi-vowel",
        "sibilant",
        "H-aspirate",
        "base-voice"
      ],
      current_actions: [
        "stopped",
        "aspirated",
        "voiced",
        "voiced-aspirated",
        "nasal",
        "semi-vowel",
        "sibilant",
        "H-aspirate",
        "base-voice"
      ]
    }
  },
  consonants: [
    .consonants[] | select(.symbol != null) | {
      symbol: .symbol,
      transliteration: .transliteration,
      ipa: .ipa,
      brahmi_parent: (
        if .symbol == "क" then "ka"
        elif .symbol == "ख" then "kha"
        elif .symbol == "ग" then "ga"
        elif .symbol == "घ" then "gha"
        elif .symbol == "ङ" then "nga"
        elif .symbol == "च" then "ca"
        elif .symbol == "छ" then "cha"
        elif .symbol == "ज" then "ja"
        elif .symbol == "झ" then "jha"
        elif .symbol == "ञ" then "nya"
        elif .symbol == "ट" then "ṭa"
        elif .symbol == "ठ" then "ṭha"
        elif .symbol == "ड" then "ḍa"
        elif .symbol == "ढ" then "ḍha"
        elif .symbol == "ण" then "ṇa"
        elif .symbol == "त" then "ta"
        elif .symbol == "थ" then "tha"
        elif .symbol == "द" then "da"
        elif .symbol == "ध" then "dha"
        elif .symbol == "न" then "na"
        elif .symbol == "प" then "pa"
        elif .symbol == "फ" then "pha"
        elif .symbol == "ब" then "ba"
        elif .symbol == "भ" then "bha"
        elif .symbol == "म" then "ma"
        elif .symbol == "य" then "ya"
        elif .symbol == "र" then "ra"
        elif .symbol == "ल" then "la"
        elif .symbol == "व" then "va"
        elif .symbol == "श" then "sha"
        elif .symbol == "ष" then "ṣa"
        elif .symbol == "स" then "sa"
        elif .symbol == "ह" then "ha"
        elif .symbol == "अ" then "?"
        else null
        end
      ),
      varga_original: (
        if .phonetic_category != null then
          if .phonetic_category | contains("Velar") then "guttural"
          elif .phonetic_category | contains("Retroflex") then "cerebral"
          elif .phonetic_category | contains("Palatal") then "palatal"
          elif .phonetic_category | contains("Dental") then "dental"
          elif .phonetic_category | contains("Labial") then "labial"
          else .phonetic_category
          end
        else null
        end
      ),
      action_mapping: {
        original: (
          if .symbol != null then
            if .symbol | test("क|च|ट|त|प") then "stopped"
            elif .symbol | test("ख|छ|ठ|थ|फ") then "aspirated"
            elif .symbol | test("ग|ज|ड|द|ब") then "voiced"
            elif .symbol | test("घ|झ|ढ|घ|भ") then "voiced-aspirated"
            elif .symbol | test("ङ|ञ|ण|न|म") then "nasal"
            elif .symbol | test("य|र|ल|व") then "semi-vowel"
            elif .symbol | test("श|ष|स") then "sibilant"
            elif .symbol | test("ह") then "H-aspirate"
            elif .symbol | test("अ") then "voice-base"
            else null
            end
          else null
          end
        ),
        current: (
          if .symbol != null then
            if .symbol | test("क|च|ट|त|प") then "stopped"
            elif .symbol | test("ख|छ|ठ|थ|फ") then "aspirated"
            elif .symbol | test("ग|ज|ड|द|ब") then "voiced"
            elif .symbol | test("घ|झ|ढ|घ|भ") then "voiced-aspirated"
            elif .symbol | test("ङ|ञ|ण|न|म") then "nasal"
            elif .symbol | test("य|र|ल|व") then "semi-vowel"
            elif .symbol | test("श|ष|स") then "sibilant"
            elif .symbol | test("ह") then "H-aspirate"
            elif .symbol | test("अ") then "voice-base"
            else null
            end
          else null
          end
        )
      }
    }
  ]
}' "$DEVANAGARI_INPUT" > "$DEVANAGARI_OUTPUT"

echo "Devanagari script data has been exported to $DEVANAGARI_OUTPUT"
