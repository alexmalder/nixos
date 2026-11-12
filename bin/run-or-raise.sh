#!/run/current-system/sw/bin/bash

current_desktop=$(xdotool get_desktop)

w=$(xdotool search --desktop "$current_desktop" --class "$1" 2>/dev/null | tail -n1); 

if [ -n "$w" ]; then 
  xdotool windowactivate "$w";
else
  if [ "$1" = "telegram" ]; then
     set -- "Telegram" "${@:2}" 
  fi
  exec "$1"
fi

