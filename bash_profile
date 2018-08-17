# autojump
[[ -s "$(brew --prefix)/etc/profile.d/autojump.sh" ]] && . "$(brew --prefix)/etc/profile.d/autojump.sh"

# bash
[[ "$TERM_PROGRAM" == "iTerm.app" ]] && bind '"\e[A": history-search-backward'  # up arrow
[[ "$TERM_PROGRAM" == "iTerm.app" ]] && bind '"\e[B": history-search-forward'   # down arrow
[[ -d "$HOME/.bash-git-prompt" ]] && . "$HOME/.bash-git-prompt/gitprompt.sh"

# bash-git-prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

# java
export JAVA8_HOME="$(/usr/libexec/java_home -v 1.8)"
export JAVA10_HOME="$(/usr/libexec/java_home -v 10.0)"
export JAVA_HOME="$JAVA8_HOME"

switch_jdk() {
    if echo "$JAVA_HOME" |grep -q 1.8; then
        export JAVA_HOME="$JAVA10_HOME"
    else
        export JAVA_HOME="$JAVA8_HOME"
    fi
    echo "JAVA_HOME=$JAVA_HOME"
}

# go
export GOPATH="$HOME/gopath"
export GOBIN="$GOPATH/bin"

# pyenv
export PYENV_ROOT=/usr/local/var/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# terminal
export CLICOLOR=true
export PATH="$PATH:/usr/local/sbin:$HOME/bin"

alias curl="curl -g"
alias g="gvim --remote-silent"

# secrets
for file in "$HOME"/.dotfiles.d/*.bash; do
    . $file
done

