# autojump
[[ -s "$(brew --prefix)/etc/profile.d/autojump.sh" ]] && . "$(brew --prefix)/etc/profile.d/autojump.sh"

# go
export GOPATH="$HOME/gopath"
export GOBIN="$GOPATH/bin"

# java
export JAVA8_HOME=$(/usr/libexec/java_home -v 1.8)
export JAVA11_HOME=$(/usr/libexec/java_home -v 11)
export JAVA_HOME=$JAVA11_HOME

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

