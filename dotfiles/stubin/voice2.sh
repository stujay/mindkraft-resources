#!/bin/bash
OIFS=$IFS

INPUTFILE=$1
START=$2 #start line number
END=$3  #end line number
INPUTCOLUMN=$4 #Source Language Column
SPEAKER1=$5 #Source Language speaker
OUTPUTCOLUMN=$6 #Output Language Column
SPEAKER2=$7 #Output language speaker



FILECOUNT=1
COUNTER=$START
IFS=,
TEMPFOLDER="tmp-${START}-${END}"
rm -rf "${TEMPFOLDER}"
mkdir -p "${TEMPFOLDER}"
FILENAME="input-${START}-${END}.csv"

awk -F, 'NR=='$START',NR=='$END' {  OFS=","; print $'$INPUTCOLUMN' "\t",$'$OUTPUTCOLUMN'}' $INPUTFILE> "${TEMPFOLDER}/${FILENAME}"

while read lang1 lang2
do
say -v $SPEAKER1 $COUNTER [[slnc 1000]] $lang1 -o "${TEMPFOLDER}/$(printf %05d $FILECOUNT).${COUNTER}.source.aiff"
let FILECOUNT+=1
say -v $SPEAKER2 [[slnc 1000]] $lang2 [[slnc 2000]] $lang2 [[slnc 2000]] -o "${TEMPFOLDER}/$(printf %05d $FILECOUNT).${COUNTER}.target.aiff"
let FILECOUNT+=1
let COUNTER+=1
done< "${TEMPFOLDER}/${FILENAME}"

IFS=$OIFS
sox $(ls ${TEMPFOLDER}/*.aiff | sort -n) "lang-audio-${START}-${END}-$SPEAKER1-$SPEAKER2.wav"
rm -rf ${TEMPFOLDER}

