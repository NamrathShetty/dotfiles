# Dotfiles Keybindings and Aliases

## Bash / Readline

Shell mode depends on the terminal:

- VS Code terminals use `emacs` keybindings.
- Other interactive shells use `vi` keybindings.

Readline bindings from [bash/.bashrc](bash/.bashrc):

| Keys | Mode | Action |
| --- | --- | --- |
| `Ctrl+V` | `vi-insert`, `vi-command` | Quote insert |
| `Ctrl+Q` | `vi-insert`, `vi-command` | Quote insert |
| `Ctrl+M` | `vi-insert`, `vi-command` | Accept line |
| `Ctrl+J` | `vi-insert`, `vi-command` | Accept line |

## Bash Aliases

| Alias | Expands To | Purpose |
| --- | --- | --- |
| `air` | `~/.air` | Run local Air binary |
| `tmux` | `tmux -u` | Force UTF-8 tmux |
| `k` | `kubectl` | Short kubectl alias |
| `ls` | `ls --color` | Colored directory listing |
| `c` | `clear` | Clear terminal |

## Hyprland

Configuration source: [hypr/.config/hypr/hyprland.conf](hypr/.config/hypr/hyprland.conf)

### Launcher and Window Control

| Keys | Action |
| --- | --- |
| `Super+Enter` | Open terminal (`alacritty`) |
| `Super+D` | Open app launcher (`rofi -show drun`) |
| `Super+Q` | Close active window |
| `Super+Shift+E` | Exit Hyprland |
| `Super+V` | Toggle floating |
| `Super+F` | Toggle fullscreen |
| `Super+Shift+B` | Reload Waybar (`pkill -SIGUSR1 waybar`) |

### Focus Movement

| Keys | Action |
| --- | --- |
| `Super+Left` | Focus left window |
| `Super+Right` | Focus right window |
| `Super+Up` | Focus upper window |
| `Super+Down` | Focus lower window |

### Workspaces

| Keys | Action |
| --- | --- |
| `Super+1` through `Super+9` | Switch to workspace 1-9 |
| `Super+Shift+1` through `Super+Shift+9` | Move focused window to workspace 1-9 |
| `Super+PageUp` | Switch to next workspace |
| `Super+PageDown` | Switch to previous workspace |
| `Super+Ctrl+Alt+Left` | Move current workspace to previous monitor |
| `Super+Ctrl+Alt+Right` | Move current workspace to next monitor |
| `Super+Ctrl+Shift+Left` | Move window to previous workspace |
| `Super+Ctrl+Shift+Right` | Move window to next workspace |
| `Super+Ctrl+Shift+Up` | Move window to previous workspace |
| `Super+Ctrl+Shift+Down` | Move window to next workspace |

### Startup App Placement

These commands run once at Hyprland startup:

- `alacritty` on workspace 1
- `firefox` on workspace 2
- `code` on workspace 3

### Mouse

| Keys | Action |
| --- | --- |
| `Super + Mouse Left` | Move window |
| `Super + Mouse Right` | Resize window |

### Hardware / Media Keys

| Key | Action |
| --- | --- |
| `XF86MonBrightnessUp` | Increase brightness by 5% |
| `XF86MonBrightnessDown` | Decrease brightness by 5% |
| `XF86AudioRaiseVolume` | Increase volume by 5% |
| `XF86AudioLowerVolume` | Decrease volume by 5% |
| `XF86AudioMute` | Toggle output mute |
| `XF86AudioMicMute` | Toggle microphone mute |
| `XF86AudioPlay` | Play / pause media |
| `XF86AudioPause` | Pause media |
| `XF86AudioNext` | Next track |
| `XF86AudioPrev` | Previous track |
| `XF86AudioStop` | Stop media |

## tmux

Configuration source: [tmux/.tmux.conf](tmux/.tmux.conf)

Prefix key is the default tmux prefix: `Ctrl+B`.

### Core Bindings

| Keys | Action |
| --- | --- |
| `Prefix+r` | Reload tmux config |
| `Prefix+h` | Select pane left |
| `Prefix+j` | Select pane down |
| `Prefix+k` | Select pane up |
| `Prefix+l` | Select pane right |
| `Prefix+Up` | Resize pane up by 5 |
| `Prefix+Down` | Resize pane down by 5 |
| `Prefix+Left` | Resize pane left by 5 |
| `Prefix+Right` | Resize pane right by 5 |
| `Alt+H` | Previous window |
| `Alt+L` | Next window |
| `Prefix+C-y` | Open `lazygit` popup |
| `Prefix+C-j` | Switch to another tmux session via popup |
| `Prefix+Shift+P` | Toggle pane logging |
| `Prefix+Alt+P` | Save a screen capture of the current pane |
| `Prefix+Alt+Shift+P` | Save the complete history of the current pane |
| `Prefix+Alt+C` | Clear current pane history |

### tmux Logging

- Logs, screen captures, and saved pane history are written under `~/.tmux/logs`.
- `tmux-logging` is provided by [tmux/.tmux.conf](tmux/.tmux.conf).

### Notes

- `vi` mode is enabled for copy mode.
- `mouse` support is on.
- Window renumbering is enabled.

## Neovim

Configuration source: [nvim/.config/nvim/lua/core/keymaps.lua](nvim/.config/nvim/lua/core/keymaps.lua)

Leader key: `Space`

### General

| Keys | Mode | Action |
| --- | --- | --- |
| `Space` | Normal, Visual | No-op |
| `Ctrl+S` | Normal | Save file |
| `Ctrl+Q` | Normal | Quit file |
| `x` | Normal | Delete character without yanking |
| `Ctrl+D` | Normal | Scroll down and center cursor |
| `Ctrl+U` | Normal | Scroll up and center cursor |
| `n` | Normal | Next search result and center |
| `N` | Normal | Previous search result and center |

### Viewport / Scope

| Keys | Mode | Action |
| --- | --- | --- |
| `Alt+J` | Normal | Scroll viewport down |
| `Alt+K` | Normal | Scroll viewport up |
| `Alt+H` | Normal | Scroll viewport left |
| `Alt+L` | Normal | Scroll viewport right |
| `Space+sc` | Normal | Toggle scope mode |

### Window / Buffer Management

| Keys | Mode | Action |
| --- | --- | --- |
| `Up` | Normal | Resize window taller |
| `Down` | Normal | Resize window shorter |
| `Left` | Normal | Resize window narrower |
| `Right` | Normal | Resize window wider |
| `Tab` | Normal | Next buffer |
| `Shift+Tab` | Normal | Previous buffer |
| `Space+x` | Normal | Delete current buffer |
| `Space+b` | Normal | Open new empty buffer |
| `Space+e` | Normal | Toggle Neo-tree sidebar |
| `Space+v` | Normal | Split vertically |
| `Space+h` | Normal | Split horizontally |
| `Space+se` | Normal | Equalize split sizes |
| `Space+xs` | Normal | Close current split |

### Split Navigation

| Keys | Mode | Action |
| --- | --- | --- |
| `Ctrl+H` | Normal | Move to left split |
| `Ctrl+J` | Normal | Move to lower split |
| `Ctrl+K` | Normal | Move to upper split |
| `Ctrl+L` | Normal | Move to right split |

### Tabs

| Keys | Mode | Action |
| --- | --- | --- |
| `Space+to` | Normal | Open new tab |
| `Space+tx` | Normal | Close current tab |
| `Space+tn` | Normal | Next tab |
| `Space+tp` | Normal | Previous tab |

### Editing

| Keys | Mode | Action |
| --- | --- | --- |
| `Space+lw` | Normal | Toggle line wrap |
| `<` | Visual | Shift left and keep selection |
| `>` | Visual | Shift right and keep selection |
| `p` | Visual | Paste without overwriting default register |

### Diagnostics

| Keys | Mode | Action |
| --- | --- | --- |
| `[d` | Normal | Previous diagnostic |
| `]d` | Normal | Next diagnostic |
| `Space+d` | Normal | Open diagnostic float |
| `Space+q` | Normal | Open diagnostics list |

### Neo-tree Notes

- Inside the Neo-tree window, `Space` toggles the selected node open or closed.
- The existing global tree toggle is `Space+e`, defined in [nvim/.config/nvim/lua/plugins/neotree.lua](nvim/.config/nvim/lua/plugins/neotree.lua), and it runs `:Neotree toggle position=left`.
