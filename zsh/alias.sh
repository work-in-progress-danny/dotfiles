#!/bin/bash
# Shell 
alias rm='rm -i'
alias cv='cv -i'
alias ln='ln -i'
alias mkdir='mkdir -p'
alias l='exa -la --icons --group-directories-first'

ltree() {
    local depth="${1:-2}"
    local path="${2:-.}"
    /usr/bin/eza --tree --level="$depth" "$path"
}

alias imfl="~/.dotfiles/scripts/binaries/git_config_emoji_switcher"

# Helpers/shortcuts
alias lus='l /dev | grep usbserial' # list usb serial ports, for arduino flashing

# Open Neovim at a specific place or here
function v () {
  if [ "$1" ]
  then
    nvim "$1"
  else
    nvim .
  fi
}

# Directories
alias desktop="cd ~/Desktop"
alias pro='cd ~/projects/'
alias noods='pro && cd ./noods'

# Dotfiles
alias d='cd ~/dotfiles/'
alias od='nvim ~/dotfiles/'

# Brain 
alias b='cd ~/Documents/Brain'
alias ob='v ~/Documents/Brain'

# Git
alias g='gitui'
alias git_authors='git log | sed -n 's/Author://p'  | sort --unique --ignore-case| column -t -s "<\*>"'
# reset
alias grh='() { git reset head~"$1" }'
# fetch
alias gfo="git fetch origin" # don't know what this does specifically 
# merge
alias gm='git merge'
alias gma='git merge --abort'
# commit
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gcane='git commit --amend --no-edit'
# branch/remote
alias gb='git branch'
alias gpsh='git push'
alias gpshfwl='git push --force-with-lease'
alias gpll='git pull -r'
alias gpllom='gpll origin main' # this will break if the "main" branch is master
alias dmb='git switch main && git branch --merged | grep -v \* | xargs git branch -d' # delete merged branches TODO make this take a "main/master" target as a param
alias gsw='git switch'
alias gswc='git switch -c'
alias gswm='git switch master'
# rebase
alias grb='git rebase'
alias grbih='git_rebase_interactive_head_script'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'
# stash
alias gsh='git stash'
alias gshki='git stash --keep-index'
alias gshl='git stash -list'
# diff 
alias gd='git diff'
alias gds='git diff --staged'
alias gdhh='git diff HEAD^ HEAD' # git diff current changes and last commit
# inspection
alias gs='git status'
alias ga='git add'
alias gl='git log'
alias glp='git log -p'

# scripts
git_rebase_interactive_head_script () {
  if [ "$1" -gt 0 ]
  then
      git rebase -i HEAD~"$1"
  else
      echo "Please provide a number to rebase by";
  fi
}

gho () { # github open branch in browser
  gh pr view -w || gh browse -b "$(git branch --show-current)"
}

alias aoct='aoc_template'
aoc_template () {
  if [ "$1" ]
  then
      touch "$1".rs && touch "$1"_input.txt && touch "$1"_prompt.md
  else
      echo "Please provide a name for the day i.e day_1";
  fi
}

# tmux
alias t='tmux'
alias tks='tmux kill-server'

# C++
alias gpp='g++ -Wall -std=c++1z'

# Javascript/Typescript
alias ts='ts-node'
## Jest
alias jtd='jest -o'
alias jof='jest --onlyFailures'
# Yarn
alias yd="yarn dev"
alias yb="yarn build"
alias yi="yarn install"
alias y="yarn"
# NPM
alias nr="npm run"

# Rails
alias rs='rails server'
alias rc='rails console'
alias rdb='rails db'

# Python
alias py='python'
alias jp='jupyter notebook'

# Rust
alias cc='cargo check'
alias cr='cargo run'
alias cb='cargo build'
alias ct='cargo test'

# Docker
alias dcup="docker-compose up"
alias dcs="docker-compose stop"

# Paru
alias in='paru -S' # install package
alias un='paru -Rns' # uninstall package
alias up='paru -Syu' # update system/package/aur
alias li='paru -Qs' # list installed package
alias la='paru -Ss' # list available package
alias rc='paru -Sc' # remove unused cache
alias ru='paru -Qtdq | paru -Rns -' # remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -

# Directory navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
alias mkdir='mkdir -p'

# Always copy recursively
alias cp='cp -r'
