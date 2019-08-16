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

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
