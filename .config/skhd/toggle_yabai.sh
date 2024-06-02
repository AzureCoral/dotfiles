#!/bin/sh


if pgrep -x "yabai" > /dev/null
then
  yabai --stop-service
  echo "Yabai stopped"
else
  yabai --start-service
  echo "Yabai started"
fi
