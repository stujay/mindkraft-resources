alias ldir='ls -d */'
alias ls='ls -GFh'
alias hidden='ls -Ad .*'
export PATH="$HOME/usr/local/bin/composer:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

alias yta='youtube-dl --extract-audio --audio-format mp3 '
alias yti='youtube-dl --write-thumbnail --skip-download'
function getvoice(){
	[ -z "$1" ] && voicename='Karen' || voicename=$1
	say -v ? | grep $voicename | awk 'BEGIN {FS="\#"}; {print $2}' | say -v $voicename
}

alias rfresh='exec zsh && source .zshrc'

function csvcolumns(){
awk 'BEGIN{ FS="," }
       { for(fn=1;fn<=NF;fn++) {print fn" = "$fn;}; exit; }
      ' $1 
}
#alias lines=find . -maxdepth 1 -exec sh -c '[ -f "$0" ] &&  printf "%6s\t\t%s\t%s\n" "$(wc -l<"$0")" "$0"' {} \;' 
alias pg='pg_ctl -D /usr/local/var/postgres start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop'
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

alias vim="nvim"
alias vi="nvim"
alias gpu="git push -u origin master"

alias wififull='sudo iwlist wlan0 scanning | egrep "Cell |Encryption|Quality|Last beacon|ESSID"'
alias swifi='sudo iwlist wlan0 scanning | egrep "ESSID"'
alias zzz='xset dpms force off'
set -o vi
alias perms="ls -a | xargs stat --printf='Name: %n\nPermissions: %a\n%A\n\n'"
alias getlarge="du -ah ./ | sort -n -r | head -n 20"
