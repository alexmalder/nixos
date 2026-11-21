#!/run/current-system/sw/bin/bash

tmux -f "$HOME/.config/tmux/tmux.conf" new -s term || tmux attach
