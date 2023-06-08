alias ldir='ls -d */'
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

alias airtraffic="sudo dump1090-mutability --interactive --net"

# LastPass with fzf (multiple selections)
lpp() {
    local selected_ids
    local selected_accounts

    selected_ids=$(lpass ls | fzf --ansi --preview "lpass show --notes {+}" --multi | awk '{print $NF}' | tr -d '[]')
    selected_accounts=$(lpass ls | grep -F "$selected_ids" | awk -F ' \\[id:' '{print $1}' | awk '{$NF=""; print $0}')

    if [[ -n $selected_ids ]]; then
        echo "$selected_ids" | xargs -I {} sh -c "lpass show {} && printf '%.0s-' {1..50} && echo"
    fi
}
# LastPass with fzf
lp() {
    local selected_id
    local selected_account

    selected_id=$(lpass ls | fzf --ansi --preview "lpass show --notes {+}" | awk '{print $NF}' | tr -d '[]')
    selected_account=$(lpass ls | grep "$selected_id" | awk -F ' \\[id:' '{print $1}' | awk '{$NF=""; print $0}')

    if [[ -n $selected_id ]]; then
        lpass show --password "$selected_id" | pbcopy
        echo "Password for $selected_account copied to clipboard."
    fi
}
