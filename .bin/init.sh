#!/bin/bash

if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

# Install xcode
xcode-select --install > /dev/null

# Install Homebrew
if [ ! -f /opt/homebrew/bin/brew ]
 then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
 else
  echo "Homebrew already installed."
fi
