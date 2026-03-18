#!/usr/bin/env bash
# Set or reset iTerm2 tab color from Claude Code hooks.
# Usage:
#   iterm-tab-color.sh green       # task complete
#   iterm-tab-color.sh amber       # needs approval
#   iterm-tab-color.sh reset       # back to default

LOG="/tmp/claude-tab-color.log"

find_tty() {
  local pid=$PPID
  echo "$(date +%H:%M:%S) [$1] walk start pid=$pid ($$=$$ PPID=$PPID)" >> "$LOG"
  while [ "$pid" -gt 1 ]; do
    local tty_name comm
    tty_name=$(ps -o tty= -p "$pid" 2>/dev/null | tr -d ' ')
    comm=$(ps -o comm= -p "$pid" 2>/dev/null | tr -d ' ')
    echo "  pid=$pid comm=$comm tty=$tty_name" >> "$LOG"
    if [ -n "$tty_name" ] && [ "$tty_name" != "??" ] && [ -w "/dev/$tty_name" ]; then
      echo "  -> found /dev/$tty_name" >> "$LOG"
      echo "/dev/$tty_name"
      return 0
    fi
    pid=$(ps -o ppid= -p "$pid" 2>/dev/null | tr -d ' ')
  done
  echo "  -> FAILED to find tty" >> "$LOG"
  return 1
}

TTY=$(find_tty "${1:-reset}") || exit 0

case "${1:-reset}" in
  green)
    printf '\033]6;1;bg;red;brightness;40\a\033]6;1;bg;green;brightness;200\a\033]6;1;bg;blue;brightness;65\a' > "$TTY"
    ;;
  amber)
    printf '\033]6;1;bg;red;brightness;255\a\033]6;1;bg;green;brightness;165\a\033]6;1;bg;blue;brightness;0\a' > "$TTY"
    ;;
  reset)
    printf '\033]6;1;bg;*;default\a' > "$TTY"
    ;;
esac
