#!/bin/bash
aspect='16/9'
inputimage=$1
filename=$(basename -- "$inputimage")
extension="${filename##*.}"
filename="${filename%.*}"
newfilename=$filename-1920x1080.jpg
currentdirectory=$(pwd)
echo 'Aspect Ratio: '$aspect
echo "inputimage:" $inputimage
echo 'Filename:' $filename
echo 'extension:' $extension
echo 'current directory: ' $currentdirectory

# magick $inputimage -gravity center \
#     -extent  "%[fx:w/h>=$aspect?h*$aspect:w]x" \
#     -extent "x%[fx:w/h<=$aspect?w/$aspect:h]" \
#     $filename.jpg
convert $inputimage -geometry 1920x1080^ -gravity center -crop 1920x1080+0+0 $currentdirectory/$newfilename 
echo "Image resized to 1920x1080"
echo "New File Name :" $newfilename
echo "This resize was brought to you by Stuart Jay Raj"
