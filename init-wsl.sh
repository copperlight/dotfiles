#!/usr/bin/env bash

PROFILE="$HOME/.profile"

if grep SSH_AUTH_SOCK $PROFILE; then
    echo "ssh-agent already installed in profile"
    exit 0
fi

cat >>"$PROFILE" <<"EOF"

# start ssh-agent and add your key
if [[ -z "$SSH_AUTH_SOCK" ]]; then
    eval $(ssh-agent -s)
    ssh-add
fi
EOF
