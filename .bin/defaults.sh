#!/bin/bash

if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

# ====================
#
# Base
#
# ====================

# Disable auto-capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# ====================
#
# Dock
#
# ====================

# Disable animation at application launch
defaults write com.apple.dock launchanim -bool false

# ====================
#
# Finder
#
# ====================

# Disable animation
defaults write com.apple.finder DisableAllAnimations -bool true

# Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show files with all extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Display the status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Display the path bar
defaults write com.apple.finder ShowPathbar -bool true

# ====================
#
# SystemUIServer
#
# ====================

# Display date, day, and time in the menu bar
defaults write com.apple.menuextra.clock DateFormat -string 'EEE d MMM HH:mm'

# Display battery level in the menu bar
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# setup apple system defaults
defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.screencapture location -string "${HOME}/Documents/Screenshots"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
defaults write com.apple.LaunchServices LSQuarantine -bool false
defaults write NSGlobalDomain InitialKeyRepeat -int 10
defaults write NSGlobalDomain KeyRepeat -int 1
# end apple system defaults

for app in "Dock" \
	"Finder" \
	"SystemUIServer"; do
	killall "${app}" &> /dev/null
done
