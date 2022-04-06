#!/usr/bin/env bash
DIR="$HOME/.config/polybar"

# Terminate already running bar instances
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar(s)
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload -q main -c "$DIR"/config.ini &
  done
else
  polybar --reload -q main -c "$DIR"/config.ini &
fi
