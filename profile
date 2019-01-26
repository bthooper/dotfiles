[ -z "$PS1" ] && return

### PROMPT
PS1="[\@ \W]\$ "

### PATH
paths=("$HOME/.bin"
"$HOME/.local/bin"
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

### ALIASES
alias l='locate -i'
alias ls='ls -GF'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
