#!/bin/bash

DOTFILES_DIR=$(cd "$(dirname "$0")"; pwd |sed -e "s:$HOME/::")

[[ ! -d "$HOME/.dotfiles.d" ]] && mkdir "$HOME/.dotfiles.d"

# vim-pathogen
[[ ! -d ./vim/autoload ]] && mkdir ./vim/autoload
[[ ! -f ./vim/autoload/pathogen.vim ]] && curl -LSso vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
[[ ! -d ./vim/bundle ]] && mkdir ./vim/bundle && ./vim/update_bundles

# sublime text
ln -nsf "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

SOURCE_DIR="$HOME/$DOTFILES_DIR/subl"
TARGET_DIR="$HOME/Library/Application Support/Sublime Text 3/Packages/User"

for FILE in $SOURCE_DIR/*; do
    FILE=$(basename "$FILE")
    ln -nsf "$SOURCE_DIR/$FILE" "$TARGET_DIR/$FILE"
done

# install dotfiles
ln -nsf "$DOTFILES_DIR/bash_profile" "$HOME/.bash_profile"
ln -nsf "$DOTFILES_DIR/vim" "$HOME/.vim"
ln -nsf "$DOTFILES_DIR/vim/vimrc" "$HOME/.vimrc"
