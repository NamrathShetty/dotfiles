#!/bin/bash

#export LANG=en_US.UTF_8
#export LC_ALL=en_US.UTF_8

set -o vi

eval "$(starship init bash)"

[[ $- == *i* ]] &&
    source -- "$(blesh-share)"/ble.sh --attach=none

bleopt prompt_ps1_transient=always

eval "$(zoxide init bash)"

# aliases
alias tmux='tmux -u'

#kubernetes
source <(kubectl completion bash)

alias k=kubectl
alias ls='ls --color'
alias c='clear'
complete -o default -F __start_kubectl k

[[ ! ${BLE_VERSION-} ]] || ble-attach

alias air='~/.air'
