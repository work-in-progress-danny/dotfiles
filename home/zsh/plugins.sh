#!/bin/bash

source ~/.nix-profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.nix-profile/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.nix-profile/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Auto suggest plugin settings
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#777777"
bindkey '^ ' autosuggest-accept

# History substring search settings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
