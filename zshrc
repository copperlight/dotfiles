# autojump
[[ -s "$(brew --prefix)/etc/profile.d/autojump.sh" ]] && . "$(brew --prefix)/etc/profile.d/autojump.sh"

# go
export GOPATH="$HOME/gopath"
export GOBIN="$GOPATH/bin"

# java
export JAVA8_HOME=$(/usr/libexec/java_home -v 1.8)
export JAVA11_HOME=$(/usr/libexec/java_home -v 11)
export JAVA_HOME=$JAVA11_HOME

# pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# terminal
export CLICOLOR=true
export PATH="$PATH:/usr/local/sbin:$HOME/bin"

alias icat="kitty +kitten icat"

# git prompt - https://joshdick.net/2017/06/08/my_git_prompt_for_zsh_revisited.html
setopt prompt_subst
autoload -U colors && colors # enable colors in prompt

export PS1='
$(ssh_info)%{$fg[magenta]%}%~%u $(git_info)
%(?.%{$fg[blue]%}.%{$fg[red]%})%(!.#.❯)%{$reset_color%} '

# secrets & snippets
for file in "$HOME"/.dotfiles.d/*.bash; do
    . $file
done
