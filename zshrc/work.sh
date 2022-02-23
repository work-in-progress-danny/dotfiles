source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

eval "$(rbenv init -)"

# Work
alias work='cd ~/work'
alias facer='cd ~/work/marketfacer/'
alias placer='cd ~/work/marketplacer/'
alias dessys='cd ~/work/design system/'
alias ppc='sh ~/.facer-pre-push-tests.sh' # runs all marketfacer tests
