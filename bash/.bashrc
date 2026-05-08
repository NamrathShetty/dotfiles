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

if command -v tmux >/dev/null 2>&1 && [ -z "${TMUX-}" ]; then
    latest_session="$(command tmux list-sessions -F '#{session_last_attached} #{session_name}' 2>/dev/null | sort -nr | awk 'NR==1 {print $2}')"

    if [ -n "$latest_session" ]; then
        command tmux attach-session -t "$latest_session"
    else
        if [ -x "$HOME/.tmux/plugins/tmux-resurrect/scripts/restore.sh" ]; then
            "$HOME/.tmux/plugins/tmux-resurrect/scripts/restore.sh"
        fi

        latest_session="$(command tmux list-sessions -F '#{session_last_attached} #{session_name}' 2>/dev/null | sort -nr | awk 'NR==1 {print $2}')"

        if [ -n "$latest_session" ]; then
            command tmux attach-session -t "$latest_session"
        else
            command tmux new-session
        fi
    fi
fi
