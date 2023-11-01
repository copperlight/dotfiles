# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# autojump
[[ -s "$(brew --prefix)/etc/profile.d/autojump.sh" ]] && . "$(brew --prefix)/etc/profile.d/autojump.sh"

# go
export GOPATH="$HOME/gopath"
export GOBIN="$GOPATH/bin"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
if which pyenv > /dev/null; then eval "$(pyenv init --path)"; fi

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# vcpkg
export VCPKG_ROOT="$HOME/vcpkg"

# terminal
export CLICOLOR=true
export PATH="$PATH:$GOBIN:$HOME/bin:$HOME/.local/bin"

# git prompt - https://joshdick.net/2017/06/08/my_git_prompt_for_zsh_revisited.html
setopt prompt_subst
autoload -U colors && colors # enable colors in prompt

export PS1='%{$fg[magenta]%}%~%u $(git_info)
%(?.%{$fg[blue]%}.%{$fg[red]%})%(!.#.❯)%{$reset_color%} '

# secrets & snippets
for file in "$HOME"/.dotfiles.d/*.bash; do
    [[ -e $file ]] && . $file
done

