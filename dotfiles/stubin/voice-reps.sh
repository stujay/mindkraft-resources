#!/bin/bash
# Note - in order for this to work, you must have SOX installed on your OSX machine. 
# You can do this via BREW by typing brew install sox

# Input Parameters
INPUTFILE=$1

# Determine the default field separator based on file extension
EXTENSION="${INPUTFILE##*.}"
if [[ "$EXTENSION" == "tsv" ]]; then
    FIELD_SEPARATOR=$'\t'
else
    FIELD_SEPARATOR=','
fi

# Override field separator if provided as a second argument
if [[ "$2" == "-F"* ]]; then
    FIELD_SEPARATOR=${2:2}
fi

TOTALLINES=$(cat $INPUTFILE | wc -l)

# Read and display column headers
HEADER=$(head -n 1 "$INPUTFILE")
IFS=$FIELD_SEPARATOR read -r -a COLUMNS <<< "$HEADER"

echo "Column headers:"
for i in "${!COLUMNS[@]}"; do
  echo "$((i + 1)). ${COLUMNS[i]}"
done

# Function to list voices for a given language
list_voices() {
  local LANGUAGE=$1
  local VOICES
  VOICES=$(say -v \? | awk -v lang="$LANGUAGE" 'BEGIN{IGNORECASE=1} $2 ~ lang {printf "%s\t%s\n", NR, $1 " " $2}')
  if [[ -z "$VOICES" ]]; then
    echo "Sorry, there is no voice available for that language."
    exit 1
  else
    echo "Possible speaker names are:"
    echo "$VOICES"
  fi
}

# Prompt for columns and languages
read -p "Select the column number for Language 1: " INPUTCOLUMN
INPUTCOLUMN=$((INPUTCOLUMN))  # Convert to zero-based index
read -p "What language is this column (use ISO 2-letter code): " INPUTLANGUAGE

list_voices "$INPUTLANGUAGE"
read -p 'Pick a speaker by their adjacent number: ' INPUTSPEAKERINDEX
SPEAKER1=$(say -v \? | awk "NR==$INPUTSPEAKERINDEX {print \$1}")
echo "You chose $SPEAKER1"

read -p "Select the column number for Language 2: " OUTPUTCOLUMN
OUTPUTCOLUMN=$((OUTPUTCOLUMN))  # Convert to zero-based index
read -p "What language is this column (use ISO 2-letter code): " OUTPUTLANGUAGE

list_voices "$OUTPUTLANGUAGE"
read -p 'Pick a speaker by their adjacent number: ' OUTPUTSPEAKERINDEX
SPEAKER2=$(say -v \? | awk "NR==$OUTPUTSPEAKERINDEX {print \$1}")
echo "You chose $SPEAKER2"

# Prompt for range of lines to process
sleep 1
echo "This file contains a total of $TOTALLINES lines."
read -p 'What line would you like to start exporting audio from? ' STARTLINE
read -p 'What line would you like to end exporting audio at? ' ENDLINE
echo "Starting export of audio files from line $STARTLINE to line $ENDLINE of $INPUTFILE."

# Process the CSV/TSV file and generate audio files
OIFS=$IFS
IFS=$FIELD_SEPARATOR
TEMPFOLDER="tmp-${STARTLINE}-${ENDLINE}"
rm -rf "${TEMPFOLDER}"
mkdir -p "${TEMPFOLDER}"
FILENAME="input-${STARTLINE}-${ENDLINE}.csv"
awk -F"$FIELD_SEPARATOR" 'NR>='$STARTLINE' && NR<='$ENDLINE' { OFS=","; print $'$INPUTCOLUMN' "\t",$'$OUTPUTCOLUMN'}' "$INPUTFILE" > "${TEMPFOLDER}/${FILENAME}"

FILECOUNT=1
COUNTER=$STARTLINE
while IFS="$FIELD_SEPARATOR" read -r lang1 lang2
do
  say -v "$SPEAKER1" "$COUNTER [[slnc 1000]] $lang1" -o "${TEMPFOLDER}/$(printf %05d $FILECOUNT).${COUNTER}.source.aiff"
  let FILECOUNT+=1
  say -v "$SPEAKER2" "[[slnc 1000]] $lang2 [[slnc 2000]] $lang2 [[slnc 2000]]" -o "${TEMPFOLDER}/$(printf %05d $FILECOUNT).${COUNTER}.target.aiff"
  let FILECOUNT+=1
  let COUNTER+=1
done < "${TEMPFOLDER}/${FILENAME}"

IFS=$OIFS
sox $(ls ${TEMPFOLDER}/*.aiff | sort -n) "lang-audio-${STARTLINE}-${ENDLINE}-$SPEAKER1-$SPEAKER2.wav"
rm -rf ${TEMPFOLDER}
