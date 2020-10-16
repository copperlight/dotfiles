# https://joshdick.net/2017/06/08/my_git_prompt_for_zsh_revisited.html

# Echoes a username/host string when connected over SSH (empty otherwise)
function ssh_info {
  [[ "$SSH_CONNECTION" != '' ]] && \
  echo '%(!.%{$fg[red]%}.%{$fg[yellow]%})%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%}:' || \
  echo ''
}
