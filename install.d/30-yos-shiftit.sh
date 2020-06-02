#!/usr/bin/env bash
# Ignore if we're not on OSX
[[ "$OSTYPE" =~ darwin* ]] || exit 0

# I don't have shiftit installed at the moment.  Also
# I don't think that sqlite command works anymore

# open ~/Applications/ShiftIt.app
# # This enables shiftit in security preferences, no seriously it does.
# sqlite3 "/Library/Application Support/com.apple.TCC/TCC.db" 'update access set allowed="1" where client like "%shiftit%";'
