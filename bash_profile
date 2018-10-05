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

# mojave setup for pyenv
# xcode-select --install
# sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /

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


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/matthewj/.sdkman"
[[ -s "/Users/matthewj/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/matthewj/.sdkman/bin/sdkman-init.sh"
