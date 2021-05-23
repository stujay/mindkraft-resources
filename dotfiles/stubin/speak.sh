#!/bin/bash
#Note - in order for this to work, you must have the 'voice2.sh' file in the same director as this file and also have SOX installed on your OSX machine.  You can do this via BREW by typing brew install sox

INPUTFILE=$1
TOTALLINES=$(cat $INPUTFILE | wc -l)
read -p 'What is the source language? (use ISO 2 letter code):' INPUTLANGUAGE
read -p "What column is the source language ($INPUTLANGUAGE)?" INPUTCOLUMN
say -v ? | awk '$2 ~ /'$INPUTLANGUAGE'/ {printf"%s)\t %s %s\n ", NR, $1,$2}' > LANG1OPTIONS.txt
echo 'Possible speaker names are:'
cat LANG1OPTIONS.txt

read -p 'Pick a speaker by their adjacent number:' INPUTSPEAKERINDEX
SPEAKER1=$(say -v ? | awk "NR==$INPUTSPEAKERINDEX")
SPEAKER1NAME=$(echo $SPEAKER1 | awk '{printf"%s", $1}')
echo "You chose $SPEAKER1NAME"

read -p 'What is the output language? (use ISO 2 letter code):' OUTPUTLANGUAGE
read -p "What column is the output language ($OUTPUTLANGUAGE)?" OUTPUTCOLUMN
say -v ? | awk '$2 ~ /'$OUTPUTLANGUAGE'/ {printf"%s)\t %s %s\n ", NR, $1,$2}' > LANG2OPTIONS.txt
echo 'Possible speaker names are:'
cat LANG2OPTIONS.txt

read -p 'Pick a speaker by their adjacent number:' OUTPUTSPEAKERINDEX
SPEAKER2=$(say -v ? | awk "NR==$OUTPUTSPEAKERINDEX")
SPEAKER2NAME=$(echo $SPEAKER2 | awk '{printf"%s", $1}')
echo "You chose $SPEAKER2NAME"

sleep 1

echo "This file contains a total of $TOTALLINES lines."
read -p 'What line would you like to start exporting audio from?' STARTLINE
read -p 'What line would you like to end exporting audio at?' ENDLINE
echo "Starting export of audio files from line $STARTLINE to line $ENDLINE of $INPUTFILE."

rm LANG1OPTIONS.txt LANG2OPTIONS.txt

bash voice2.sh $INPUTFILE $STARTLINE $ENDLINE $INPUTCOLUMN $SPEAKER1NAME $OUTPUTCOLUMN $SPEAKER2NAME

