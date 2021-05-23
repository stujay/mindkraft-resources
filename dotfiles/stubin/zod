#!/bin/bash
zodiac="鼠 牛 虎 兔 龍 蛇 馬 羊 猴 雞 狗 豬"
echo '=== Original ===' | tee $HOME/zodiac-output.txt
# takes string of chinese characters
# then ensures there is a space between each one using sed substitution
# then using sed again, puts a new line after every 6 characters (note chinese character + spacex3=6)
echo $zodiac| sed -r 's/(.)[^ ]\+/ \1 \ /g' | sed 's/.\{8\}/&\n/g' | tee -a $HOME/zodiac-output.txt

# Now to do the same, but this time we need to shuffle them
# use 'tr' to transpose all spaces to a new line first so shuffle can shuffle the line order
#then once shuffled, it deletes the new line characters to put it all back on one line
# then using sed, adds spaces back (could have done this all in one - but showing step by step)
# then adds a new line return \n after each 6 characters

echo '=== Shuffled ===' | tee -a $HOME/zodiac-output.txt
echo $zodiac| sed -r 's/(.)[^ ]\+/ \1 \ /g' | tr " " "\n" | shuf | tr -d "\n" | sed -r 's/(.)/\1 /g' | sed 's/.\{8\}/&\n/g' | tee -a $HOME/zodiac-output.txt


# note 'tee' is used to allw the output to be shown on the screen, as well as writing to a file called 'zodiac-output' in your HOME directory.   
# You can open that file in Vim as read-only by typing:
# vim -R ~/zodiac-output.txt
# if you type while you're in VIM - :set autoread
# and then :e! zodiac-output.txt
# the file will reload each time you run the zod command
# this allows you to use vim to then play with the text and even use the text-to-speech on them to test your recall
