import json

# Load data from JSON files
with open('thai-abugida.json', 'r', encoding='utf-8') as f:
    abugida_data = json.load(f)

with open('thai-all.json', 'r', encoding='utf-8') as f:
    all_data = json.load(f)

# Create the combined structure
combined_data = {
    "script": {
        "name": "Thai",
        "iso": "Thai",
        "brahmic_name": "ไทย",
        "tonal": True,
        "consonant_classes": ["high", "mid", "low"],
        "varga_names": ["guttural", "palatal", "cerebral", "dental", "labial"],
        "actions": ["stopped", "aspirated", "nasal", "sibilant", "voiced"]
    },
    "consonants": [],
    "vowels": []  # Add vowel data here if available
}

# Map the data from thai-abugida.json
for item in abugida_data:
    consonant = {
        "symbol": item.get("consonant"),
        "brahmi_parent": item.get("brahmi-parent"),
        "transliteration": item.get("transliteration"),
        "index": item.get("index"),
        "ipa": item.get("ipa")
    }
    combined_data["consonants"].append(consonant)

# Merge additional consonant data from thai-all.json
for consonant in combined_data["consonants"]:
    for item in all_data:
        if consonant["symbol"] == item["Symbol"]:
            consonant.update({
                "class": item.get("Class"),
                "varga_original": item.get("varga-original"),
                "varga_current": item.get("varga-current"),
                "action_current": item.get("action-current"),
                "action_original": item.get("action-original"),
                "name_thai": item.get("Name_Thai"),
                "name_rtgs": item.get("Name_RTGS"),
                "name_meaning": item.get("Name_Meaning"),
                "rtgs_initial": item.get("RTGS _Initial"),
                "rtgs_final": item.get("RTGS _Final"),
                "ipa_initial": item.get("IPA_Initial"),
                "ipa_final": item.get("IPA_Final")
            })

# Save the combined data to a new JSON file
with open('combined_thai_script.json', 'w', encoding='utf-8') as f:
    json.dump(combined_data, f, ensure_ascii=False, indent=2)

print("Combined data saved to combined_thai_script.json")

