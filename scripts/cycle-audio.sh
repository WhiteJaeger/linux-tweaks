#!/usr/bin/env bash

# Get list of sink names
mapfile -t SINKS < <(
  pactl list short sinks |
  awk '!/easyeffects|Easy Effects|EE Sink/ {print $2}'
)

# Get current default sink
CURRENT=$(pactl info | awk -F': ' '/Default Sink/ {print $2}')

# Safety check
[[ ${#SINKS[@]} -lt 2 ]] && exit 0

# Find next sink
for i in "${!SINKS[@]}"; do
  if [[ "${SINKS[$i]}" == "$CURRENT" ]]; then
    NEXT_INDEX=$(( (i + 1) % ${#SINKS[@]} ))
    NEXT="${SINKS[$NEXT_INDEX]}"
    break
  fi
done

# Set default sink
pactl set-default-sink "$NEXT"

# Move all current audio streams to the new sink
for INPUT in $(pactl list short sink-inputs | awk '{print $1}'); do
  pactl move-sink-input "$INPUT" "$NEXT"
done
