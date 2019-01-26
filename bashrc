[ -z "$PS1" ] && return
### PROMPT
PS1="[\u@\h] /\W \$ "
### PATH
paths=("/usr/local/bin"
"$HOME/.bin"
"$HOME/.local/bin"
"$HOME/bin"
)
for path in "${paths[@]}"; do
    if echo -n "$path" | grep -q $PATH; then
        continue
    fi
    PATH="$path:$PATH:/users/bryan/bin"
done
export PATH
unset path paths
### VARIABLES
export EDITOR="vim"
export LANG="en_US.UTF-8"
export TERM="screen-256color"
### ALIASES
alias l='locate -i'
alias ls='ls -GF'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

printf "\nWelcome Reverend Hooper.\nToday is $(date "+%A, %B %d, %Y").\n\nThe time in Barnet, Vermont is $(date "+%I:%M%p %Z").  "

printf "You are running MacOS X, version "
sw_vers -productVersion
printf "\n\n"
printf "This moment's fortune: \n\n"
fortune
printf "\n\n"
curl wttr.in/~Barnet_Vermont?0?u
printf "\n"
