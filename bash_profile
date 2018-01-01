# ansible
export ANSIBLE_HOST_KEY_CHECKING=False

# autojump
[[ -s "$(brew --prefix)/etc/profile.d/autojump.sh" ]] && . "$(brew --prefix)/etc/profile.d/autojump.sh"

# bash
[[ "$TERM_PROGRAM" == "iTerm.app" ]] && bind '"\e[A": history-search-backward'  # up arrow
[[ "$TERM_PROGRAM" == "iTerm.app" ]] && bind '"\e[B": history-search-forward'   # down arrow
[[ -d "$HOME/.bash-git-prompt" ]] && . "$HOME/.bash-git-prompt/gitprompt.sh"

# java
export JAVA7_HOME="$(/usr/libexec/java_home -v 1.7)"
export JAVA8_HOME="$(/usr/libexec/java_home -v 1.8)"
export JAVA_HOME="$JAVA8_HOME"

switch_jdk() {
    if echo "$JAVA_HOME" |grep -q 1.8; then
        export JAVA_HOME="$JAVA7_HOME"
    else
        export JAVA_HOME="$JAVA8_HOME"
    fi
    echo "JAVA_HOME=$JAVA_HOME"
}

# jenv
#export JENV_ROOT=/usr/local/var/jenv
#if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# go
export GOPATH="$HOME/gopath"
export GOBIN="$GOPATH/bin"

# pyenv
export PYENV_ROOT=/usr/local/var/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# terminal
export CLICOLOR=true
export TERM=xterm-color
export PATH="$PATH:/usr/local/sbin:$HOME/bin"

alias curl="curl -g"
alias g="gvim --remote-silent"

# secrets
for file in "$HOME"/.dotfiles.d/*.bash; do
    . $file
done

