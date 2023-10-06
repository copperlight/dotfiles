#!/usr/bin/env bash

# macos command line tools
xcode-select --install

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

packages=(
    "autojump"
    "cloc"
    "go"
    "jq"
    "pyenv"
    "tree"
    "the_silver_searcher"
)

for p in "${packages[@]}"; do
    brew install "$p"
done

# pet
brew install knqyf263/pet/pet

# scalafmt
brew install coursier/formulas/coursier
coursier install scalafmt
ln -s "$HOME/Library/Application Support/Coursier/bin"/* "$HOME/bin"

# java
curl -s "https://get.sdkman.io" | bash

sdk install java 17.0.8-zulu

# python
eval "$(pyenv init -)"

pyenv install 3.11.5
pyenv global 3.11.5

# icloud drive
ln -nsf "$HOME/Library/Mobile Documents/com~apple~CloudDocs" "$HOME/CloudDocs"

# git
mkdir -p bin
mkdir -p "$HOME/git/stash"
mkdir -p "$HOME/git/github/copperlight"
pushd "$HOME/git/github/copperlight" || exit 1
git clone git@github.com:copperlight/dotfiles.git
popd || exit 1
