#!/bin/bash

DOTFILES_DIR=$(cd $(dirname $0); pwd |sed -e "s:$HOME/::")

[[ ! -d "$HOME/.dotfiles.d" ]] && mkdir "$HOME/.dotfiles.d"

# vim-pathogen
[[ ! -d ./vim/autoload ]] && mkdir ./vim/autoload
[[ ! -f ./vim/autoload/pathogen.vim ]] && curl -LSso vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
[[ ! -d ./vim/bundle ]] && mkdir ./vim/bundle
./vim/update_bundles

ln -nsf "$DOTFILES_DIR/bash_profile" "$HOME/.bash_profile"
ln -nsf "$DOTFILES_DIR/vim" "$HOME/.vim"
ln -nsf "$DOTFILES_DIR/vim/vimrc" "$HOME/.vimrc"
