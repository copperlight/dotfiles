#!/bin/bash

# usage:
# - install ssh keys
# - curl -fsSL https://raw.githubusercontent.com/copperlight/dotfiles/master/bootstrap.sh | /bin/bash
# - install sublime text; start st; quit st; start st
# - init-dots.sh

DOTFILES_DIR=$(cd "$(dirname "$0")" || exit; pwd)

# osx command line tools
xcode-select --install

# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

packages=(
    "autojump"
    "fish"
    "git"
    "jq"
    "leiningen"
    "node"
    "pyenv"
    "scala"
    "shellcheck"
    "tree"
    "the_silver_searcher"
    "zeromq"
)

for p in "${packages[@]}"; do
    brew install "$p"
done

# java
brew cask install java8
brew cask install java

JAVA_SECURITY="$(/usr/libexec/java_home -v 1.8)/jre/lib/security/java.security"
sed -i -e "s/^#crypto.policy=unlimited/crypto.policy=unlimited/g" $JAVA_SECURITY

# pyenv
export PYENV_ROOT=/usr/local/var/pyenv
eval "$(pyenv init -)"

env PYTHON_CONFIGURE_OPTS="--enable-framework --enable-unicode=ucs2" pyenv install 2.7.14
env PYTHON_CONFIGURE_OPTS="--enable-framework --enable-unicode=ucs2" pyenv install 3.6.3

pyenv global 3.6.3 2.7.14

pip install pip --upgrade
pip install flake8

packages=(
    "awscli"
    "flake8"
    "gitpython"
    "jedi"
    "jupyter"
    "requests"
)

for p in "${packages[@]}"; do
    pip install "$p"
done

mkdir -p "$HOME/git/stash"
mkdir -p "$HOME/git/github/copperlight"

# npm
npm install -g jshint

# vim bundles
git clone git@github.com:copperlight/dotfiles.git "$HOME/git/github/copperlight/dotfiles"

cd "$HOME/git/github/copperlight/dotfiles/vim" && ./update_bundles.py

# sublime text
INSTALLED_DIR="$HOME/Library/Application Support/Sublime Text 3/Installed Packages"

[[ ! -d "$INSTALLED_DIR" ]] && mkdir -p "$INSTALLED_DIR"

curl -s -o "$INSTALLED_DIR/Package Control.sublime-package" \
  "https://sublime.wbond.net/Package Control.sublime-package"

PACKAGE_DIR="$HOME/Library/Application Support/Sublime Text 3/Packages/User"

[[ ! -d "$PACKAGE_DIR" ]] && mkdir -p "$PACKAGE_DIR"

cp "$DOTFILES_DIR/subl/User/Package Control.sublime-settings" \
  "$PACKAGE_DIR/Package Control.sublime-settings"

