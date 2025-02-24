#!/bin/bash
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Auto suggest plugin settings
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#777777"
bindkey 'tab' autosuggest-accept

# History substring search settings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

export STARSHIP_CONFIG=~/.config/starship.toml
export SSH_AUTH_SOCK=~/.1password/agent.sock

eval "$(starship init zsh)"
eval "$(fnm env --use-on-cd)"
