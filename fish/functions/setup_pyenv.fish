function setup_pyenv
    set -g -x CFLAGS -O2 -I(brew --prefix openssl)/include
    set -g -x LDFLAGS -L(brew --prefix openssl)/lib
    echo "CFLAGS=$CFLAGS"
    echo "LDFLAGS=$LDFLAGS"
end
