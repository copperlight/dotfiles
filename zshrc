# autojump
[[ -s "$(brew --prefix)/etc/profile.d/autojump.sh" ]] && . "$(brew --prefix)/etc/profile.d/autojump.sh"

# go
export GOPATH="$HOME/gopath"
export GOBIN="$GOPATH/bin"

# pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# terminal
export CLICOLOR=true
export PATH="$PATH:/usr/local/sbin:$HOME/bin"

alias icat="kitty +kitten icat"

# secrets
for file in "$HOME"/.dotfiles.d/*.bash; do
    . $file
done

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
