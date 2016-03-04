local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c% %{$reset_color%}'
PROMPT="$PROMPT\$(~/.git-radar/git-radar --zsh --fetch) "
RPROMPT="%F{green}%~%f"
