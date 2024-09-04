import os
import sys
import re
import googleapiclient.discovery

def get_video_id(url):
    # Regular expression to extract video ID from URL
    video_id_match = re.match(r'(https?://)?(www\.)?(youtube\.com|youtu\.?be)/.+v=([^&=%\?]{11})', url)
    if video_id_match:
        return video_id_match.group(4)
    else:
        print("Invalid YouTube URL")
        sys.exit(1)

def get_comments(video_id):
    comments = []
    next_page_token = None

    while True:
        request = youtube.commentThreads().list(
            part="snippet",
            videoId=video_id,
            pageToken=next_page_token,
            maxResults=100  # Max number of results per page
        )
        response = request.execute()

        for item in response["items"]:
            comment = item["snippet"]["topLevelComment"]["snippet"]["textDisplay"]
            comments.append(comment)

        next_page_token = response.get("nextPageToken")

        if not next_page_token:
            break

    return comments

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python download_comments.py <YouTube_URL>")
        sys.exit(1)

    youtube_url = sys.argv[1]
    video_id = get_video_id(youtube_url)

    # Retrieve the API key from environment variables
    api_key = os.getenv("YOUTUBE_API_KEY")
    if not api_key:
        print("Please set the YOUTUBE_API_KEY environment variable.")
        sys.exit(1)

    # Build the YouTube service object
    youtube = googleapiclient.discovery.build("youtube", "v3", developerKey=api_key)

    comments = get_comments(video_id)
    with open("comments.txt", "w", encoding="utf-8") as file:
        for comment in comments:
            file.write(comment + "\n")
    
    print(f"Downloaded {len(comments)} comments.")

