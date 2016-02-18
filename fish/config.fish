# java
set -x JAVA7_HOME (/usr/libexec/java_home -v 1.7)
set -x JAVA8_HOME (/usr/libexec/java_home -v 1.8)
set -x JAVA_HOME $JAVA8_HOME

function switch_jdk
    if echo "$JAVA_HOME" |grep -q 1.8
        set -x JAVA_HOME $JAVA7_HOME
    else
        set -x JAVA_HOME $JAVA8_HOME
    end
    echo JAVA_HOME=$JAVA_HOME
end

# go
set -x GOPATH $HOME/gopath
set -x GOBIN $GOPATH/bin

# pyenv
set -x PYENV_ROOT /usr/local/var/pyenv
if which pyenv > /dev/null
    pyenv init - | source
end

# terminal
set -x PATH $PATH /usr/local/sbin $HOME/bin

# secrets
for file in $HOME/.dotfiles.d/*.fish
    source $file
end

