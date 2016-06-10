# ansible
set -x ANSIBLE_HOST_KEY_CHECKING False

# autojump
test -s (brew --prefix)/share/autojump/autojump.fish; and source (brew --prefix)/share/autojump/autojump.fish

# java
set -x JAVA7_HOME (/usr/libexec/java_home -v 1.7)  # brew cask install caskroom/versions/java7
set -x JAVA8_HOME (/usr/libexec/java_home -v 1.8)  # brew cask install java
set -x JAVA_HOME $JAVA8_HOME

# go
set -x GOPATH $HOME/gopath
set -x GOBIN $GOPATH/bin

# pyenv
set -x PYENV_ROOT /usr/local/var/pyenv
if which pyenv > /dev/null
    pyenv init - | source
end

# terminal
set -x PATH $PATH /usr/local/sbin $HOME/bin $GOBIN

# secrets
for file in $HOME/.dotfiles.d/*.fish
    source $file
end
