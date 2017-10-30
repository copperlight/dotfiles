function setup_pyenv
    set -g -x CFLAGS -I(brew --prefix openssl)/include
    set -g -x LDFLAGS -L(brew --prefix openssl)/lib
    echo "CFLAGS=$CFLAGS"
    echo "LDFLAGS=$LDFLAGS"
end
