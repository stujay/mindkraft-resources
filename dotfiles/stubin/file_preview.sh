#!/bin/bash

FILE_PATH=$1
FILE_EXTENSION="${FILE_PATH##*.}"
PREVIEW_X=$2
PREVIEW_Y=$3
PREVIEW_WIDTH=$4
PREVIEW_HEIGHT=$5

case "$FILE_EXTENSION" in
    png|jpg|jpeg|gif)
        ueberzug layer -s < <(
            echo '{ "action": "add", "identifier": "preview", "x": '$PREVIEW_X', "y": '$PREVIEW_Y', "width": '$PREVIEW_WIDTH', "height": '$PREVIEW_HEIGHT', "path": "'$FILE_PATH'" }'
            read -r
        ) &
        PREVIEW_PID=$!
        trap 'kill $PREVIEW_PID' EXIT
        wait $PREVIEW_PID
        ;;
    mp4|mkv|webm)
        ffmpegthumbnailer -i "$FILE_PATH" -o /tmp/preview.png -s 0
        ueberzug layer -s < <(
            echo '{ "action": "add", "identifier": "preview", "x": '$PREVIEW_X', "y": '$PREVIEW_Y', "width": '$PREVIEW_WIDTH', "height": '$PREVIEW_HEIGHT', "path": "/tmp/preview.png" }'
            read -r
        ) &
        PREVIEW_PID=$!
        trap 'kill $PREVIEW_PID' EXIT
        wait $PREVIEW_PID
        ;;
    *)
        bat --paging=never --style=plain --color=always "$FILE_PATH"
        ;;
esac

