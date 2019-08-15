#!/bin/bash

# usage:
# - install ssh keys
# - curl -fsSL https://raw.githubusercontent.com/copperlight/dotfiles/master/bootstrap.sh | /bin/bash
# - install sublime text; start st; quit st; start st
# - init-dots.sh

# osx command line tools
xcode-select --install

# sdkman
curl -s "https://get.sdkman.io" | bash

sdk install java 8.0.222-zulu

# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

packages=(
    "autojump"
    "coreutils"
    "git"
    "gnu-sed"
    "jq"
    "leiningen"
    "node"
    "pyenv"
    "sbt"
    "scala"
    "shellcheck"
    "tree"
    "the_silver_searcher"
)

for p in "${packages[@]}"; do
    brew install "$p"
done

brew install knqyf263/pet/pet

# pyenv
export PYENV_ROOT=/usr/local/var/pyenv
eval "$(pyenv init -)"

pyenv install 3.7.4
pyenv global 3.7.4

# git directories
mkdir -p "$HOME/git/stash"
mkdir -p "$HOME/git/github/copperlight"

# npm
npm install -g jshint
