#!/run/current-system/sw/bin/bash
# Usage: run-or-raise.sh <workspace_name> <default_command> [window_class]

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <workspace_name> <default_command> [window_class]" >&2
    exit 1
fi

WS="$1"
CMD="$2"
# Use the 3rd parameter if provided, otherwise default to the command name
CLASS="${3:-$CMD}"

# Check if the workspace exists and has at least one open window
HAS_WINDOWS=$(i3-msg -t get_tree | jq -r --arg ws "$WS" '
  [.. | objects | select(.type? == "workspace" and .name == $ws) | ((.nodes | length) + (.floating_nodes | length)) > 0] | any
')

if [ "$HAS_WINDOWS" = "true" ]; then
    # Workspace has apps open: switch to it and try to focus the target class
    i3-msg workspace "$WS" >/dev/null
    i3-msg "[workspace=\"$WS\" class=\"(?i)$CLASS\"] focus" >/dev/null
else
    # Workspace is empty: switch to it and launch the default app
    i3-msg workspace "$WS" >/dev/null
    nohup $CMD >/dev/null 2>&1 &
fi

