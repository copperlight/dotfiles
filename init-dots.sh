#!/bin/bash

DOTFILES_DIR=$(cd "$(dirname "$0")" || exit; pwd)
TMP_DIR=$(mktemp -dt dotfiles)

# keybindings
[[ ! -d "$HOME/Library/KeyBindings" ]] && mkdir "$HOME/Library/KeyBindings"
ln -nsf "$DOTFILES_DIR/osx/DefaultKeyBinding.dict" "$HOME/Library/KeyBindings/DefaultKeyBinding.dict"

# secrets
[[ ! -d "$HOME/.dotfiles.d" ]] && mkdir "$HOME/.dotfiles.d"

# clojure
[[ ! -d "$HOME/.lein" ]] && mkdir "$HOME/.lein"
ln -nsf "$DOTFILES_DIR/clj/profiles.clj" "$HOME/.lein/profiles.clj"

[[ ! -d "$HOME/bin" ]] && mkdir "$HOME/bin"
for FILE in lein-exec lein-exec-p; do
    curl -so "$TMP_DIR/$FILE" "https://raw.githubusercontent.com/kumarshantanu/lein-exec/master/$FILE" && chmod 755 "$TMP_DIR/$FILE"
    if [[ -f "$HOME/bin/$FILE" ]]; then
        if [[ "$(md5 -q "$HOME/bin/$FILE")" != "$(md5 -q "$TMP_DIR/$FILE")" ]]; then
            mv "$TMP_DIR/$FILE" "$HOME/bin"
        fi
    else
        mv "$TMP_DIR/$FILE" "$HOME/bin" 
    fi
done

# vim-pathogen
[[ ! -d ./vim/autoload ]] && mkdir ./vim/autoload

curl -LSso "$TMP_DIR/pathogen.vim" https://tpo.pe/pathogen.vim
if [[ -f ./vim/autoload/pathogen.vim ]]; then
    if [[ "$(md5 -q ./vim/autoload/pathogen.vim)" != "$(md5 -q "$TMP_DIR/pathogen.vim")" ]]; then
        mv "$TMP_DIR/pathogen.vim" ./vim/autoload
    fi
else
    mv "$TMP_DIR/pathogen.vim" ./vim/autoload
fi

[[ ! -d ./vim/bundle ]] && mkdir ./vim/bundle && ./vim/update_bundles.py

# sublime text
ln -nsf "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

SOURCE_DIR="$DOTFILES_DIR/subl"
TARGET_DIR="$HOME/Library/Application Support/Sublime Text 3/Packages"

for PACKAGE in $SOURCE_DIR/*; do
    PACKAGE=$(basename "$PACKAGE")
    [ ! -d "$TARGET_DIR/$PACKAGE" ] && mkdir -p "$TARGET_DIR/$PACKAGE"
    for FILE in $SOURCE_DIR/$PACKAGE/*; do
        FILE=$(basename "$FILE")
        [ -d "$TARGET_DIR/$PACKAGE/$FILE" ] && rm -rf "${TARGET_DIR:?}/$PACKAGE/$FILE"
        ln -nsf "$SOURCE_DIR/$PACKAGE/$FILE" "$TARGET_DIR/$PACKAGE/$FILE"
    done
done

# fish
[[ ! -d "$HOME/.config/fish" ]] && mkdir -p "$HOME/.config/fish"

# ipython
[[ ! -d "$HOME/.ipython/profile_default" ]] && mkdir -p "$HOME/.ipython/profile_default"
[[ -d "$HOME/.ipython/profile_default/startup" ]] && rm -rf "$HOME/.ipython/profile_default/startup"

# install dotfiles
ln -nsf "$DOTFILES_DIR/bash_profile" "$HOME/.bash_profile"
ln -nsf "$DOTFILES_DIR/fish/config.fish" "$HOME/.config/fish/config.fish"
ln -nsf "$DOTFILES_DIR/fish/functions" "$HOME/.config/fish/functions"
ln -nsf "$DOTFILES_DIR/ipython/profile_default/ipython_config.py" "$HOME/.ipython/profile_default/ipython_config.py"
ln -nsf "$DOTFILES_DIR/ipython/profile_default/ipython_kernel_config.py" "$HOME/.ipython/profile_default/ipython_kernel_config.py"
ln -nsf "$DOTFILES_DIR/ipython/profile_default/startup" "$HOME/.ipython/profile_default/startup"
ln -nsf "$DOTFILES_DIR/vim" "$HOME/.vim"
ln -nsf "$DOTFILES_DIR/vim/vimrc" "$HOME/.vimrc"

# cleanup
rm -rf "$TMP_DIR"
