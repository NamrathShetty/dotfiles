#!/usr/bin/env bash

#export LANG=en_US.UTF_8
#export LC_ALL=en_US.UTF_8

if [[ ${TERM_PROGRAM-} == vscode ]]; then
    # VS Code agents inject commands more reliably with emacs keybindings.
    set -o emacs
else
    set -o vi
fi

stty -ixon 2>/dev/null || true

bind -m vi-insert '"\C-v":quoted-insert'
bind -m vi-command '"\C-v":quoted-insert'
bind -m vi-insert '"\C-q":quoted-insert'
bind -m vi-command '"\C-q":quoted-insert'
bind -m vi-insert '"\C-m":accept-line'
bind -m vi-command '"\C-m":accept-line'
bind -m vi-insert '"\C-j":accept-line'
bind -m vi-command '"\C-j":accept-line'

eval "$(starship init bash)"

if [[ $- == *i* && -z ${TMUX-} && ${TERM_PROGRAM-} != vscode ]]; then
    source -- "$(blesh-share)"/ble.sh --attach=none
fi

if [[ ${BLE_VERSION-} && -z ${TMUX-} && ${TERM_PROGRAM-} != vscode ]]; then
    bleopt prompt_ps1_transient=always
fi

eval "$(zoxide init bash)"

#kubernetes
if command -v kubectl >/dev/null 2>&1; then
    source <(kubectl completion bash)
    complete -o default -F __start_kubectl k
fi

if [[ ! ${BLE_VERSION-} || -n ${TMUX-} || ${TERM_PROGRAM-} == vscode ]]; then
    :
else
    ble-attach
fi

alias air='~/.air'

# aliases
alias tmux='tmux -u'
alias k=kubectl
alias ls='ls --color'
alias c='clear'

if [[ $- == *i* && -z ${TMUX-} && ( -n ${ALACRITTY_WINDOW_ID-} || ${TERM_PROGRAM-} == Alacritty ) ]]; then
    if command tmux has-session 2>/dev/null; then
        latest="$(command tmux list-sessions -F '#{session_last_attached} #{session_name}' 2>/dev/null | sort -rn | head -1 | awk '{print $2}')"
        if [[ -n $latest ]]; then
            command tmux attach-session -t "$latest"
        fi
    else
        command tmux new-session
    fi
fi