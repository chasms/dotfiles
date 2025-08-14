#!/bin/bash

#       ╭─────────────────────────╮
# ╭─────   Include Shell Scripts   ───────────────────────────────────────────╮
#       ╰─────────────────────────╯

include() {
    for FILE in $(find "$1" -type f -print | sort); do
        source $FILE
    done
}

# Pull in all shell scripts from the .shell_scripts directory
include ~/.shell_scripts

# Setup Dotfiles Bare Repo Git Alias
alias dotfiles='`which git` --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Git Bash Completion
if [ -f '`which brew` --prefix'/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Case-Insensitive Auto Completion
bind "set completion-ignore-case on"

#       ╭────────────────────────────────────╮
# ╭─────   Final Configurations and Plugins   ────────────────────────────────╮
#       ╰────────────────────────────────────╯

# NVM
export NVM_DIR=~/.nvm
# Load nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# Load nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
export NODE_PATH=$NODE_PATH:$(npm root -g)

# RVM
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
eval "$(rbenv init - --no-rehash bash)"
