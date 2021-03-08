#!/usr/bin/env bash


# install homebrew

# install dev tools xcode

# run bootstrap.sh

# run brew.sh

# run shell.sh

# setup loginscript on macos
chmod +x .loginscript.sh
sudo defaults write com.apple.loginwindow LoginHook `pwd`/.loginscript.sh
