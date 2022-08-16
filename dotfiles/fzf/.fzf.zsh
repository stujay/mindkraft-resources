export FZF_DEFAULT_OPS="--extended"
export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {}'"
export FZF_ALT_C_COMMAND='fd --type d . --color=never --hidden'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"

alias lp="lpass ls | fzf | sed 's/.*\[id\:\s\([^]]*\)\].*/\1/g' | xargs -I{} lpass show -p {} | xclip -selection clipboard"

alias lpp="lpass ls | fzf | sed 's/.*\[id\:\s\([^]]*\)\].*/\1/g' | xargs -I{} lpass show  {}" 
# Use the one below if you want to actually show the password in the shell as well as copy to clipboard
# alias lp="lpass ls | fzf | sed 's/.*\[id\:\s\([^]]*\)\].*/\1/g' | xargs -I{} lpass show -p {} | xclip -selection clipboard && xclip -out -selection clipboard"
