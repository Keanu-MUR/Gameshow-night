#!/bin/bash
# The Chihuahua Cup - opens the game in its own window. No internet needed.
DIR="$(cd "$(dirname "$0")" && pwd)"
PAGE="$DIR/chihuahua-cup.html"
if [ ! -f "$PAGE" ]; then echo "chihuahua-cup.html is missing. Keep this launcher in the same folder as the game file."; exit 1; fi
URL="file://$(printf '%s' "$PAGE" | sed 's/ /%20/g')"
for APP in "Google Chrome" "Microsoft Edge" "Brave Browser"; do
  if [ -d "/Applications/$APP.app" ]; then
    open -na "$APP" --args --user-data-dir="$DIR/data" --no-first-run --no-default-browser-check --start-maximized --app="$URL"
    exit 0
  fi
done
# No Chrome, Edge or Brave found: open in whatever browser is the default.
open "$PAGE"
