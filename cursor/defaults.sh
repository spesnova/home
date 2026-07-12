#!/bin/sh

set -eu

# Disable macOS's double-space period substitution in Cursor only.
/usr/bin/defaults write com.todesktop.230313mzl4w4u92 \
  NSAutomaticPeriodSubstitutionEnabled -bool false
