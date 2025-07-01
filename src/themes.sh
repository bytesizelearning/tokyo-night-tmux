#!/usr/bin/env bash

SELECTED_THEME="$(tmux show-option -gv @tokyo-night-tmux_theme)"
TRANSPARENT_THEME="$(tmux show-option -gv @tokyo-night-tmux_transparent)"

case $SELECTED_THEME in
"storm")
  declare -A THEME=(
    ["background"]="#24283b"
    ["foreground"]="#a9b1d6"
    ["black"]="#414868"
    ["blue"]="#7aa2f7"
    ["cyan"]="#7dcfff"
    ["green"]="#73daca"
    ["magenta"]="#bb9af7"
    ["red"]="#f7768e"
    ["white"]="#a9b1d6"
    ["yellow"]="#e0af68"

    ["bblack"]="#FF4500"   # Orange Red (bright)
    ["bblue"]="#00BFFF"    # Deep Sky Blue
    ["bcyan"]="#00FFFF"    # Cyan / Aqua
    ["bgreen"]="#32CD32"   # Lime Green
    ["bmagenta"]="#FF00FF" # Magenta / Fuchsia
    ["bred"]="#FF6347"     # Tomato (bright red)
    ["bwhite"]="#F0E68C"   # Khaki (bright pale yellow)
    ["byellow"]="#FFD700"  # Gold (bright yellow)
  )
  ;;

"day")
  declare -A THEME=(
    ["background"]="#d5d6db"
    ["foreground"]="#343b58"
    ["black"]="#0f0f14"
    ["blue"]="#34548a"
    ["cyan"]="#0f4b6e"
    ["green"]="#33635c"
    ["magenta"]="#5a4a78"
    ["red"]="#8c4351"
    ["white"]="#343b58"
    ["yellow"]="#8f5e15"

    ["bblack"]="#FF8C00"   # Dark Orange (bright orange)
    ["bblue"]="#1E90FF"    # Dodger Blue
    ["bcyan"]="#40E0D0"    # Turquoise
    ["bgreen"]="#3CB371"   # Medium Sea Green
    ["bmagenta"]="#DA70D6" # Orchid (bright magenta)
    ["bred"]="#FF4500"     # Orange Red
    ["bwhite"]="#EEE8AA"   # Pale Goldenrod
    ["byellow"]="#FFFF00"  # Yellow (bright)
  )
  ;;

*)
  # Default to night theme
  declare -A THEME=(
    ["background"]="#FF69B4"
    ["foreground"]="#a9b1d6"
    ["black"]="#414868"
    ["blue"]="#7aa2f7"
    ["cyan"]="#7dcfff"
    ["green"]="#73daca"
    ["magenta"]="#bb9af7"
    ["red"]="#f7768e"
    ["white"]="#c0caf5"
    ["yellow"]="#e0af68"

    ["bblack"]="#FF69B4"   # Hot Pink
    ["bblue"]="#00CED1"    # Dark Turquoise
    ["bcyan"]="#7FFFD4"    # Aquamarine
    ["bgreen"]="#ADFF2F"   # Green Yellow
    ["bmagenta"]="#DA3FFF" # Vivid Magenta
    ["bred"]="#FF4500"     # Orange Red
    ["bwhite"]="#FFFFE0"   # Light Yellow
    ["byellow"]="#FFA500"  # Orange
  )
  ;;
esac

# Override background with "default" if transparent theme is enabled
if [ "${TRANSPARENT_THEME}" == 1 ]; then
  THEME["background"]="default"
fi

THEME['ghgreen']="#3fb950"
THEME['ghmagenta']="#A371F7"
THEME['ghred']="#d73a4a"
THEME['ghyellow']="#d29922"

RESET="#[fg=${THEME[foreground]},bg=${THEME[background]},nobold,noitalics,nounderscore,nodim]"
