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

# install dotfiles
ln -nsf "$DOTFILES_DIR/bash_profile" "$HOME/.bash_profile"

# install vimrc
ln -nsf "$DOTFILES_DIR/vimrc" "$HOME/.vimrc"

# cleanup
rm -rf "$TMP_DIR"
