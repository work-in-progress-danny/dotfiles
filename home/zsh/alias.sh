#!/bin/bash

# Command Relearning
alias find='echo "use fd, https://github.com/sharkdp/fd. Remove when it makes sense, 14 Jan" find'

# Shell 
alias rm='rm -i'
alias cv='cv -i'
alias ln='ln -i'
alias mkdir='mkdir -p'
alias l='~/.dotfiles/scripts/binaries/fully_sick_ls'
alias imfl="~/.dotfiles/scripts/binaries/git_config_emoji_switcher"
# alias rm="bin_chicken"

# Helpers/shortcuts
alias lus='l /dev | grep usbserial' # list usb serial ports, for arduino flashing

# alias vr='nvim' # nvim auto-sessions will resume if nvim is opened without a flag or path to the cwd
# alias v='nvim .' # this will open nvim and not resume auto-sessions
alias v='open_nvim_script' # temp nvim auto-sessions don't work when using a path
open_nvim_script () {
  if [ "$1" ]
  then
    ~/.nix-profile/bin/nvim "$1"
  else
    ~/.nix-profile/bin/nvim .
  fi
}

# Directories
alias desktop="cd ~/Desktop"
alias dev='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/dev'
alias pro='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/dev/projects/'
alias goose='pro && cd GooseElectronics'

# Dotfiles
alias d='cd ~/.dotfiles/'
alias od='nvim ~/.dotfiles/'

# Brain 
alias b='cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Brain'
alias ob='v ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Brain'

## Projects
alias menu='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/dev/projects/menu'
alias cs50='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/dev/projects/cs50'
alias aoc='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/dev/projects/advent_of_code/'

# Nix Home-Manager
alias hms="home-manager -f ~/.dotfiles/home.nix switch"
alias ncg="nix-collect-garbage --delete-older-than 7d"
alias ncu="nix-channel --update"
alias wc="ncu && hms && ncg"

# Git
alias g='gitui'
alias gwtc='~/.dotfiles/scripts/src/git_worktree_creator/target/release/git_worktree_creator'
alias git_authors='git log | sed -n 's/Author://p'  | sort --unique --ignore-case| column -t -s "<\*>"'
# reset
alias grh="git reset head~"
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


# C++
alias gpp='g++ -Wall -std=c++1z'

# Javascript/Typescript
alias ts='ts-node'
## Jest
alias jtd='jest -o'
alias jof='jest --onlyFailures'
# Yarn
alias yd="yarn dev"
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

# Docker
alias dcup="docker-compose up"
alias dcs="docker-compose stop"
