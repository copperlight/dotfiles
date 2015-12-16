#!/bin/bash

DOTFILES_DIR=$(cd "$(dirname "$0")"; pwd |sed -e "s:$HOME/::")

[[ ! -d "$HOME/.dotfiles.d" ]] && mkdir "$HOME/.dotfiles.d"

# vim-pathogen
[[ ! -d ./vim/autoload ]] && mkdir ./vim/autoload
[[ ! -f ./vim/autoload/pathogen.vim ]] && curl -LSso vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
[[ ! -d ./vim/bundle ]] && mkdir ./vim/bundle && ./vim/update_bundles

# sublime text
SUBL_DIR="$HOME/$DOTFILES_DIR/subl"
ln -nsf "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
ln -nsf "$SUBL_DIR/Git.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Git.sublime-settings"
ln -nsf "$SUBL_DIR/Groovy.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Groovy.sublime-settings"
ln -nsf "$SUBL_DIR/Preferences.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
ln -nsf "$SUBL_DIR/Scala.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Scala.sublime-settings"
ln -nsf "$SUBL_DIR/SublimeLinter.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/SublimeLinter.sublime-settings"

# install dotfiles
ln -nsf "$DOTFILES_DIR/bash_profile" "$HOME/.bash_profile"
ln -nsf "$DOTFILES_DIR/vim" "$HOME/.vim"
ln -nsf "$DOTFILES_DIR/vim/vimrc" "$HOME/.vimrc"
