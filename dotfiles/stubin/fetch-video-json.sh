#!/bin/bash

# Check if input is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <YouTube Channel URL or Channel Name>"
  exit 1
fi

INPUT=$1

# Check if input is a full URL or a channel name
if [[ "$INPUT" =~ ^https?:// ]]; then
  CHANNEL_URL=$INPUT
else
  CHANNEL_URL="https://www.youtube.com/@$INPUT"
fi

# Output the URL being fetched
echo "Fetching data from: $CHANNEL_URL"

# Fetch JSON data for all videos on the channel
yt-dlp -j "$CHANNEL_URL" | tee videos.json

# Process JSON and output Markdown
jq -r '
  . as $video |
  .id as $id |
  .title as $title |
  .description as $description |
  .upload_date as $upload_date |
  .duration as $duration |
  .thumbnails[-1].url as $thumbnail_url |
  .tags as $tags |
  "* [\($title)](https://www.youtube.com/watch?v=\($id))\n  - Description: \($description | @sh)\n  - Date Uploaded: \($upload_date)\n  - Duration: \($duration) seconds\n  - Thumbnail: ![\($title)](\($thumbnail_url))\n  - Keywords: \($tags | join(\", \"))"
' videos.json | tee videos.md
