import os
import json
import subprocess

# MongoDB connection details
mongo_uri = 'mongodb+srv://stujay:TkAvHLcgnbq6VUQ5@crackinglanguage.f9lqp.mongodb.net/consonant_compass'

# Directory containing the JSON files
output_dir = './output/'

def fix_json_format(filepath):
    """Check and fix the JSON format of the file."""
    with open(filepath, 'r', encoding='utf-8') as file:
        data = json.load(file)
    
    # Check if the file is already an array, if not, wrap it in an array
    if not isinstance(data, list):
        print(f"Fixing JSON format for {filepath}")
        data = [data]

        # Write the fixed JSON back to the file
        with open(filepath, 'w', encoding='utf-8') as file:
            json.dump(data, file, ensure_ascii=False, indent=4)

def import_to_mongodb(filepath):
    """Use mongoimport to import the file into MongoDB."""
    collection_name = 'consonants'
    try:
        command = [
            'mongoimport',
            f'--uri={mongo_uri}',
            f'--collection={collection_name}',
            '--drop',
            f'--file={filepath}',
            '--jsonArray'
        ]
        result = subprocess.run(command, capture_output=True, text=True)
        if result.returncode == 0:
            print(f"Successfully imported {filepath} into MongoDB.")
        else:
            print(f"Error importing {filepath}: {result.stderr}")
    except Exception as e:
        print(f"Failed to import {filepath}: {str(e)}")

def process_files_in_directory(directory):
    """Process all JSON files in the specified directory."""
    for filename in os.listdir(directory):
        if filename.endswith('_consonants_seed.json'):
            filepath = os.path.join(directory, filename)
            
            # Fix the JSON format
            fix_json_format(filepath)
            
            # Import the file into MongoDB
            import_to_mongodb(filepath)

def main():
    """Main function to process and import all files."""
    process_files_in_directory(output_dir)

if __name__ == '__main__':
    main()
