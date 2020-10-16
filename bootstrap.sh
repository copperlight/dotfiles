#!/usr/bin/env bash

# osx command line tools
xcode-select --install

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

packages=(
    "autojump"
    "cloc"
    "coreutils"
    "gnu-sed"
    "imagemagick"
    "jq"
    "pyenv"
    "tree"
    "the_silver_searcher"
)

for p in "${packages[@]}"; do
    brew install "$p"
done

brew install knqyf263/pet/pet
brew install --HEAD olafurpg/scalafmt/scalafmt

# python
eval "$(pyenv init -)"

pyenv install 2.7.17
pyenv install 3.5.19
pyenv install 3.6.10
pyenv install 3.7.5
pyenv install 3.8.1
pyenv global 3.7.5 3.8.1 3.6.10 3.5.9

# java
pushd "$HOME/Downloads" || exit 1
curl -O https://cdn.azul.com/zulu/bin/zulu11.41.23-ca-jdk11.0.8-macosx_x64.dmg
curl -O https://cdn.azul.com/zulu/bin/zulu8.48.0.53-ca-jdk8.0.265-macosx_x64.dmg
popd || exit 1

# git
mkdir -p "$HOME/git/stash"
mkdir -p "$HOME/git/github/copperlight"
pushd "$HOME/git/github/copperlight" || exit 1
git clone git@github.com:copperlight/dotfiles.git
popd || exit 1
