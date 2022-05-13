# Command Relearning
alias find='echo "use fd, https://github.com/sharkdp/fd. Remove when it makes sense, 14 Jan"'

# Shell 
alias rm='rm -i'
alias cv='cv -i'
alias ln='ln -i'
alias mkdir='mkdir -p'
alias l='exa -hal --group-directories-first --git --time-style=long-iso' # exa ( modern ls replacement https://github.com/ogham/exa )
alias ltree='~/.dotfiles/scripts/exa_list_tree'

# Terminal Multiplexer
alias z='zellij -s home'

# Helpers/shortcuts
alias lus='l /dev | grep usbserial' # list usb serial ports, for arduino flashing
alias v='~/.nix-profile/bin/nvim'

# Directories
alias school='cd ~/school'
alias dev='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/dev'
alias desktop="cd ~/Desktop"
alias fun='cd ~/fun'
alias menu='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/dev/projects/menu'
alias mono='menu && cd menu-monorepo'
alias brain='cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Brain'
alias cs50='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/dev/cs50'

# Work
alias work='cd ~/work'
alias mlab='cd ~/work/manager-lab'
alias dmod='cd ~/work/develop-module/frontend'

# Edit Dotfiles
alias dotfiles='cd ~/.dotfiles/'
alias odotfiles='code ~/.dotfiles/'

# Git
alias g='gitui'
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
git_rebase_interactive_head_script(){
  if [ $1 -gt 0 ]
  then
      git rebase -i HEAD~$1
  else
      echo "Please provide a number to rebase by";
  fi
}

# C++
alias gpp='g++ -Wall -std=c++1z'

# JavaScript
# Typescript
alias ts='ts-node'
## Jest
alias jtd='jest -o'
alias jof='jest --onlyFailures'
# Yarn
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
