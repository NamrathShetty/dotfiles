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

if [[ $- == *i* && ${TERM_PROGRAM-} != vscode ]]; then
    source -- "$(blesh-share)"/ble.sh --attach=none
fi

if [[ ${BLE_VERSION-} && ${TERM_PROGRAM-} != vscode ]]; then
    bleopt prompt_ps1_transient=always
fi

eval "$(zoxide init bash)"

__bash_history_setup() {
    local shared_history_file="$HOME/.bash_history"
    local history_dir="${XDG_STATE_HOME:-$HOME/.local/state}/bash-history"

    mkdir -p "$history_dir"

    shopt -s histappend 2>/dev/null || true

    if [[ -n ${TMUX-} ]]; then
        local window_key current_lines

        window_key="$(command tmux display-message -p '#{session_name}_#{window_id}' 2>/dev/null || printf 'tmux')"
        window_key="${window_key//[^A-Za-z0-9._-]/_}"

        HISTFILE="$history_dir/${window_key}.history"
        touch "$HISTFILE"

        history -c
        history -r "$HISTFILE" 2>/dev/null || true

        current_lines="$(wc -l < "$HISTFILE" 2>/dev/null || printf '0')"
        __bash_history_last_synced="$current_lines"

        __bash_history_sync() {
            local total_lines

            history -a

            total_lines="$(wc -l < "$HISTFILE" 2>/dev/null || printf '0')"
            if (( total_lines > __bash_history_last_synced )); then
                tail -n +$((__bash_history_last_synced + 1)) "$HISTFILE" >> "$shared_history_file"
                __bash_history_last_synced="$total_lines"
            fi
        }
    else
        HISTFILE="$shared_history_file"

        __bash_history_sync() {
            history -a
            history -n
        }
    fi

    if [[ -n ${PROMPT_COMMAND-} ]]; then
        PROMPT_COMMAND="__bash_history_sync; $PROMPT_COMMAND"
    else
        PROMPT_COMMAND="__bash_history_sync"
    fi

    trap '__bash_history_sync' EXIT
}

__bash_history_setup

#kubernetes
if command -v kubectl >/dev/null 2>&1; then
    source <(kubectl completion bash)
    complete -o default -F __start_kubectl k
fi

if [[ ! ${BLE_VERSION-} || ${TERM_PROGRAM-} == vscode ]]; then
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