#!/bin/sh

system_type=$(uname -s)

source ./env.sh

if [ "$system_type" = "Darwin" ]; then

  if type xcode-select >&- && xpath=$( xcode-select --print-path ) && test -d "${xpath}" && test -x "${xpath}" ; then 

	echo "Xcode command line tools installed"
  else
	xcode-select --install
  fi

  # install homebrew if it's missing
  if ! command -v brew >/dev/null 2>&1; then
    echo "Installing homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi


  source ./config/bootstrap.sh

fi
