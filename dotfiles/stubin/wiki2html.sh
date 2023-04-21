#!/bin/bash

FORCE="$1"
SYNTAX="$2"
EXTENSION="$3"
OUTPUTDIR="$4"
INPUT="$5"
CSSFILE="$6"

FILE=$(basename "$INPUT")
FILENAME=$(basename "$INPUT" .$EXTENSION)
FILEPATH=${INPUT%$FILE}
OUTDIR=${OUTPUTDIR%$FILEPATH*}
OUTPUT="$OUTDIR"/$FILENAME

# Determine relative path to root directory
RELATIVE_PATH=$(realpath --relative-to="$OUTDIR" "$FILEPATH")

if [ "$RELATIVE_PATH" = "." ]; then
    CSSRELATIVE="./style.css"
else
    PARENT_DIRS=$(echo "$RELATIVE_PATH" | tr '/' '\n' | sed -e '1d' -e '$d' | wc -l)
    if [ $PARENT_DIRS -eq 0 ]; then
        CSSRELATIVE="../style.css"
    else
        CSSRELATIVE=$(printf '../%.0s' $(seq 1 $PARENT_DIRS))"style.css"
    fi
fi

HAS_MATH=$(grep -o "\$\$.\+\$\$" "$INPUT")
if [ ! -z "$HAS_MATH" ]; then
    MATH="--mathjax=https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"
else
    MATH=""
fi

sed -r 's/(\[.+\])\(([^)]+)\)/\1(\2.html)/g' <"$INPUT" | pandoc $MATH -s -f $SYNTAX -t html -c "$CSSFILE" | sed -r 's/<li>(.*)\[ \]/<li class="todo done0">\1/g; s/<li>(.*)\[X\]/<li class="todo done4">\1/g' >"$OUTPUT.html"

if [ "$FORCE" != "noforce" ]; then
    open "$OUTPUT.html"
fi
