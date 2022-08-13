#linux
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:~/local/bin

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias em='emacs -nw'
alias dd='dd status=progress'
alias _='sudo'
alias _i='sudo -i'


# alias dump1090 = '/home/jay/Other_Services/dump1090/dump1090 --interactive --net --enable-agc'
# check if local bin folder exist
# $HOME/bin
export PATH=$HOME/mindkraft-resources/dotfiles/stubin/:$PATH
# prepend it to $PATH if so
if [ -d $HOME/bin ]; then
    export PATH=$HOME/bin:$PATH
fi
if [ -d /snap/bin  ]; then
	export PATH=/snap/bin:$PATH
fi

if [ -d /usr/local/lib/ruby/gems/3.0.0/bin  ]; then
	export PATH=/usr/local/lib/ruby/gems/3.0.0/bin:$PATH
fi

function get_headers(){
	head -n1 $1 | sed 's/[;|,]/\n/g|nl'
}

alias headers=get_headers
export VISUAL='nvim'
export EDIOR="$VISUAL"
# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
 bindkey '^xe' edit-command-line
 bindkey '^x^e' edit-command-line
# Vi style:
# zle -N edit-command-line
bindkey -M vicmd v edit-command-line
export HOMEBREW_NO_AUTO_UPDATE=1

alias lt='find . -mtime -1 -type f -print'
# Note that lastpass-cli must be installed to use lpass functions - this is copy the password to clipboard
alias lp="lpass ls | fzf | sed 's/.*\[id\:\s\([^]]*\)\].*/\1/g' | xargs -I{} lpass show -p {} | xclip -selection clipboard"

# Use the one below if you want to actually show the password in the shell as well as copy to clipboard
# alias lp="lpass ls | fzf | sed 's/.*\[id\:\s\([^]]*\)\].*/\1/g' | xargs -I{} lpass show -p {} | xclip -selection clipboard && xclip -out -selection clipboard"
