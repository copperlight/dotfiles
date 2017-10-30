# ansible
set -x ANSIBLE_HOST_KEY_CHECKING False

# autojump
test -s (brew --prefix)/share/autojump/autojump.fish; and source (brew --prefix)/share/autojump/autojump.fish

# java
set -x JAVA8_HOME (/usr/libexec/java_home -v 1.8)  # brew cask install caskroom/versions/java8
set -x JAVA9_HOME (/usr/libexec/java_home -v 1.9)  # brew cask install java
set -x JAVA_HOME $JAVA9_HOME

# go
set -x GOPATH $HOME/gopath
set -x GOBIN $GOPATH/bin

# pyenv
set -x PYENV_ROOT /usr/local/var/pyenv
if which pyenv > /dev/null
    pyenv init - | source
end

# terminal
set -x PATH $PATH $HOME/bin $GOBIN

# secrets
for file in $HOME/.dotfiles.d/*.fish
    source $file
end
