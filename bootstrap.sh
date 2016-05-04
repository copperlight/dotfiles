#!/bin/bash

# usage:
# curl -fsSL https://raw.githubusercontent.com/copperlight/dotfiles/master/bootstrap.sh | /bin/bash

# osx command line tools
xcode-select --install

# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

packages=(
    "autojump"
    "fish"
    "git"
    "leiningen"
    "pyenv"
    "the_silver_searcher"
)

for p in "${packages[@]}"; do
    brew install $p
done

# pyenv
export PYENV_ROOT=/usr/local/var/pyenv
eval "$(pyenv init -)"

pyenv install 2.7.11
pyenv install 3.5.1
pyenv global 2.7.11

packages=(
    "awscli"
    "gitpython"
    "ipython"
    "--no-binary :all: jupyter"
    "requests"
)

pip install pip --upgrade

for p in "${packages[@]}"; do
    pip install $p
done

mkdir -p $HOME/git/stash
mkdir -p $HOME/git/github/copperlight

# vim bundles
git clone git@github.com:copperlight/dotfiles.git $HOME/git/github/copperlight

cd $HOME/git/github/copperlight/dotfiles/vim && ./update_bundles.py

