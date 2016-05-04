#!/bin/bash

# usage:
# curl -fsSL https://raw.githubusercontent.com/copperlight/dotfiles/master/bootstrap.sh | /bin/bash

DOTFILES_DIR=$(cd "$(dirname "$0")" || exit; pwd)

# osx command line tools
xcode-select --install

# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

packages=(
    "autojump"
    "fish"
    "git"
    "leiningen"
    "node"
    "pyenv"
    "shellcheck"
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
    "flake8"
    "gitpython"
    "ipython"
    "jedi"
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

# sublime text
INSTALLED_DIR="$HOME/Library/Application Support/Sublime Text 3/Installed Packages"

[[ ! -d "$INSTALLED_DIR" ]] && mkdir -p "$INSTALLED_DIR"

curl -s -o "$INSTALLED_DIR/Package Control.sublime-package" \
  "https://sublime.wbond.net/Package Control.sublime-package"

PACKAGE_DIR="$HOME/Library/Application Support/Sublime Text 3/Packages/User"

[[ ! -d "$PACKAGE_DIR" ]] && mkdir -p "$PACKAGE_DIR"

cp "$DOTFILES_DIR/subl/User/Package Control.sublime-package" \
  "$PACKAGE_DIR/Package Control.sublime-package"

