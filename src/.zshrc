# zshrc - Configuration zsh file read on interactive shells

# autoloads
autoload -U compinit #promptinit
compinit
#promptinit; prompt walters

source $HOME/.zsh/git-prompt/zshrc.sh
export PROMPT='$(git_super_status)> '
export RPROMPT="%F{green}%~%f"

# Prompts
case $TERM in
   xterm*|rxvt*|screen)
   precmd () {print -Pn "\e]0;%n@%m: %~\a"}
   preexec () { print -Pn "\e]0;%n@%m: $1\a" }
   ;;
esac

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    flag="--indicator-style=none"
    colorflag="--color"
else # OS X `ls`
    flag=""
    colorflag="-G"
fi

for i in `ls ${flag} $HOME/.env`; do
    source $HOME/.env/$i
done

# Aliases
alias cp='nocorrect cp' # no spelling correction on cp
alias df='df -h'
alias dh='dirs -v'
alias dodo='sudo /sbin/shutdown -h now'
alias du='du -h'
alias grep='grep --color=auto'
alias la='ls -a'
alias l='ls -lh'
alias ls='ls -F ${colorflag}'
alias mkdir='nocorrect mkdir' # no spelling correction on mkdir
alias mv='nocorrect mv' # no spelling correction on mv
alias sft='noglob find . -name \*~?~ -exec rm -f {} +'

# List only directories and symbolic
# links that point to directories
alias lsd='ls -ld *(-/DN)'

# List only file beginning with "."
alias lsa='ls -ld .*'

# Global aliases -- These do not have to be
# at the beginning of the command line.
alias -g L='| less'
alias -g LV="| /usr/share/vim/vimcurrent/macros/less.sh --cmd ':set filetype=diff' -"
alias -g G='| grep'
alias -g V='| vim -'
alias -g P='| ~/src/resty/pypp'

# Suffix Aliases
alias -s pdf="zathura "

# history settings
HISTFILE=~/.zshhistory
HISTSIZE=3000
SAVEHIST=3000


# Other misc settings
LISTMAX=0
DIRSTACKSIZE=8


#eval `dircolors -b ~/.dircolors`
export ZLS_COLORS=$LS_COLORS

#Pager
export LESS=-FSRX
export LESS_TERMCAP_mb=$'\E[01;31m'    # début de blink
export LESS_TERMCAP_md=$'\E[01;31m'    # début de gras
export LESS_TERMCAP_me=$'\E[0m'        # fin
export LESS_TERMCAP_so=$'\E[01;44;33m' # début de la ligne d`état
export LESS_TERMCAP_se=$'\E[0m'        # fin
export LESS_TERMCAP_us=$'\E[01;32m'    # début de souligné
export LESS_TERMCAP_ue=$'\E[0m'        # fin

# Editor and Browser
export EDITOR="vim"
export BROWSER="firefox"

#mpd
export MPD_HOST="lateralus"

#mail
export MAIL=/var/spool/mail/$USER

#Oracle
export ORACLE_HOME="/usr/lib/oracle/10.2.0.4/client64"

# Path
export PATH="/opt/local/bin:/opt/local/sbin:$PATH:$HOME/bin:/opt/e17/bin:/usr/local/bin:/usr/lib/tracker:$ERL_G/bin"
export MANPATH=$MANPATH:/usr/local/share/man
export PYTHONPATH="/opt/e17/lib/python2.7/site-packages:/home/oli/bin:/home/oli/openerp/server/trunk:/home/oli/tryton/trytond"

# Expansion options
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:history-words' stop verbose
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false

# Menu for completion with keyboard navigation
#zstyle ':completion:*' menu select=2
#zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

# Don't complete elements if already selected in rm,cp,mv
zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:mv:*' ignore-line yes
zstyle ':completion:*:cp:*' ignore-line yes

# Completion caching
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

# Completion for xdvi
xdvi() { command xdvi ${*:-*.dvi(om[1])} }
zstyle ':completion:*:*:xdvi:*' menu yes select
zstyle ':completion:*:*:xdvi:*' file-sort time

bindkey -e                 # emacs key bindings

bindkey '^R'    history-incremental-search-backward
bindkey '^[[3~' delete-char
bindkey "\e[5~" history-search-backward
bindkey "\e[6~" history-search-forward
bindkey '^[[7~' beginning-of-line
bindkey '^[[8~' end-of-line


# zsh Options

setopt			   \
	autopushd 	   \
	correct		   \
	correctall	   \
	histignorealldups  \
	pushdminus         \
	pushdsilent        \
	pushdtohome	   \
	sharehistory

unsetopt ignore_eof	   \
	list_ambiguous

if [ -f /usr/share/autojump/autojump.sh ]; then
    . /usr/share/autojump/autojump.sh
fi
if [ -f /opt/local/etc/profile.d/autojump.sh ]; then
    . /opt/local/etc/profile.d/autojump.sh
fi

if [ $commands[keychain] ]; then
    keychain -q id_rsa
fi

stty stop undef # to unmap ctrl-s
