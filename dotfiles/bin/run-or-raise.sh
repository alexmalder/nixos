#!/run/current-system/sw/bin/bash

# Usage: run-or-raise.sh <command> [window_class]
# If window_class is omitted, <command> is used as the class.

if [ -z "$1" ]; then
    echo "Usage: $0 <command> [window_class]" >&2
    exit 1
fi

CMD="$1"
CLASS="${2:-$1}"

# Check if a window matching the class (case-insensitive) exists in the i3 tree.
# i3-msg returns "ERROR" if no matching window is found.
if i3-msg -t get_tree | grep -qi "\"class\":\"[^\"]*${CLASS}[^\"]*\""; then
    i3-msg "[class=\"(?i)${CLASS}\"] focus" >/dev/null
else
    # Launch the application detached from the script
    nohup "$CMD" >/dev/null 2>&1 &
fi

