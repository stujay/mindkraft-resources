# aliasrc.sh
# Shared aliases and functions for the mindkraft group
# Source from .zshrc: source ~/mindkraft-resources/dotfiles/alias/aliasrc.sh

# ---------------------------------------------------------------------------
# Generic Aliases
# ---------------------------------------------------------------------------
alias vim="nvim"
alias vi="nvim"
alias ldir='ls -d */'
alias rfresh='exec zsh'
alias getlarge="du -ah ./ | sort -n -r | head -n 20"

# YouTube (works with youtube-dl or yt-dlp aliased to youtube-dl)
alias yta='youtube-dl --extract-audio --audio-format mp3'
alias yti='youtube-dl --write-thumbnail --skip-download'

# Postgres
alias pg='pg_ctl -D /usr/local/var/postgres start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop'

# ---------------------------------------------------------------------------
# Functions
# ---------------------------------------------------------------------------

# List CSV column names with their index
csvcolumns() {
    awk 'BEGIN{ FS="," }
         { for(fn=1;fn<=NF;fn++) {print fn" = "$fn;}; exit; }
        ' $1
}

# Hear what a macOS voice sounds like
getvoice() {
    [ -z "$1" ] && voicename='Karen' || voicename=$1
    say -v ? | grep $voicename | awk 'BEGIN {FS="\#"}; {print $2}' | say -v $voicename
}

# ---------------------------------------------------------------------------
# Linux-only (uncomment on Linux machines)
# ---------------------------------------------------------------------------
# alias wififull='sudo iwlist wlan0 scanning | egrep "Cell |Encryption|Quality|Last beacon|ESSID"'
# alias swifi='sudo iwlist wlan0 scanning | egrep "ESSID"'
# alias zzz='xset dpms force off'
# alias perms="ls -a | xargs stat --printf='Name: %n\nPermissions: %a\n%A\n\n'"
# alias airtraffic="sudo dump1090-mutability --interactive --net"
#alias lines='find . -maxdepth 1 -exec sh -c '\''[ -f "$0" ] && printf "%6s\t\t%s\t%s\n" "$(wc -l<"$0")" "$0"'\'' {} \;'
