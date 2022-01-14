set __FRESH_BIN_PATH__ $HOME/.fresh/build/shell.sh

if not set -q TMUX
    set -g TMUX tmux new-session -d -s base
    eval $TMUX
    tmux attach-session -d -t base
end

if status is-interactive
    starship init fish | source
    echo ---\n- fresh isnt working at the moment\n- also want to change the `available command` highlighting colour to something more contrasty\n---
end

# source .fresh/build/shell.sh

alias cat='echo "use bat, https://github.com/sharkdp/bat#installation. Remove Oct 12"'
alias find='echo "use fd, https://github.com/sharkdp/fd. Remove Nov 12"'

function use_dotfiles_command
   echo "use dotfiles command. Remove Nov 28"
end

# Command Relearning
alias cat='echo "use bat, https://github.com/sharkdp/bat#installation. Remove Oct 12"'
alias find='echo "use fd, https://github.com/sharkdp/fd. Remove Nov 12"'

function use_dotfiles_command
  echo "use dotfiles command. Remove Nov 28"
end

alias lvimrc='use_dotfiles_command'
alias nvimrc='use_dotfiles_command'
alias vimrc='use_dotfiles_command'
alias zshrc='use_dotfiles_command'

# Work
alias work='cd ~/work'
alias facer='cd ~/work/marketfacer'
alias placer='cd ~/work/marketplacer'
alias interns='cd ~/work/interns'
alias ppc='sh ~/.facer-pre-push-tests.sh' # runs all marketfacer tests

# Shell
alias rm='rm -i'
alias cv='cv -i'
alias ln='ln -i'
function mkdir
    command mkdir -p $argv
end 
alias l='exa -hal --group-directories-first --git --time-style=long-iso' # exa ( modern ls replacement https://github.com/ogham/exa )
function ltree 
    if test $argv[1] -gt 0
        command exa --tree --level=$argv[1] -hal --git --time-style=long-iso
    else
        command exa --tree --level=2 -hal --git --time-style=long-iso
    end 
end

# Helpers/shortcuts
alias lus='l /dev | grep usbserial' # list usb serial ports, for arduino flashing
alias v='/Users/danny/.local/bin/lvim'
alias lvim='/Users/danny/.local/bin/lvim'

# Directories
alias school='cd ~/school'
alias dev='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/dev'
alias desktop="cd ~/Desktop"
alias fun='cd ~/fun'
alias menu='cd /Users/danny/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/dev/projects/dannyontheinter_net/menu-creator-app'
alias brain='cd /Users/danny/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Brain'

# Edit Dotfiles
alias dotfiles='cd ~/.dotfiles'

# Git
# commit
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gcane='git commit --amend --no-edit'
# branch/remote
alias gpsh=' git push'
alias gpshfwl='git push --force-with-lease'
alias gpll='git pull -r'
alias dmb='git switch main && git branch --merged | grep -v \* | xargs git branch -d' # delete merged branches
alias gsw='git switch'
alias gswc='git switch -c'
# rebase
alias grb='git rebase'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'
function grbih # rebase by a given integer
    if $argv[1] -gt 0
        git rebase -i HEAD~$argv[1]
    else
        echo "Please provide a number to rebase by"
    end 
end
# stash
alias gsh='git stash'
alias gshki='git stash --keep-index'
alias gshl='git stash -list'
# other
alias gdhh='git diff HEAD^ HEAD' # git diff current changes and last commit
alias gs='git status'
alias ga='git add'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git log'
alias glp='git log -p'

# # C++
alias gpp='g++ -Wall -std=c++1z'

# JavaScript
## Typescript
alias ts='ts-node'

## Jest
alias jtd='jest -o'
alias jof='jest --onlyFailures'

## Yarn
alias yd="yarn dev"
alias yi="yarn install"

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
alias dcup="docker-compose up -d"
alias dcs="docker-compose stop"

