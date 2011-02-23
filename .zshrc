# zshrc - Configuration zsh file read on interactive shells

# autoloads
autoload -U compinit #promptinit
compinit
#promptinit; prompt walters

export PROMPT='> '
export RPROMPT="%F{${1:-green}}%~%f"

# Prompts
case $TERM in
   xterm*|rxvt*|screen)
   precmd () {print -Pn "\e]0;%n@%m: %~\a"}
   preexec () { print -Pn "\e]0;%n@%m: $1\a" }
   ;;
esac

# Aliases
#alias click_n_prove='$HOME/unif/memoire/tools/Click_n_Prove.V2.0/Click_n_Prove'
alias c='python bin/openerp-client.py'
alias cda='cd ~/openerp/addons/current'
alias cdc='cd ~/openerp/client/current'
alias cdd='cd ~/openerp/doc/trunk'
alias cdh='cd ~/openerp/addons-hrself/current'
alias cds='cd ~/openerp/server/groupes-6.0'
alias cdw='cd ~/openerp/client-web/groupes-6.0'
alias cp='nocorrect cp -i' # no spelling correction on cp
alias d='bzr cdiff L'
alias df='df -h'
alias dh='dirs -v'
alias dodo='sudo /sbin/shutdown -h now'
alias du='du -h'
alias grep='grep --color=auto'
alias h='history'
#alias history='fc -l 1'
alias hibernate='sudo hibernate'
alias la='ls -a'
alias l='ls -lh'
alias ls="ls -F --color=auto"
alias m='bzr missing'
alias mkdir='nocorrect mkdir' # no spelling correction on mkdir
alias mv='nocorrect mv -i' # no spelling correction on mv
alias o='python2.5 bin/openerp-server.py -c .openerp_serverrc'
alias p='bzr push'
alias rm='rm -i'
alias s='bzr st'
alias sft="noglob find . -name '*.~*~' -exec rm -f {} +"
alias so='screen -S openerp -c $HOME/.screenrc.openerp'
alias w='python2.5 openerp-web.py'

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


# history settings
HISTFILE=~/.zshhistory
HISTSIZE=3000
SAVEHIST=3000


# Other misc settings
LISTMAX=0
DIRSTACKSIZE=8


eval `dircolors -b ~/.dircolors`
export ZLS_COLORS=$LS_COLORS

#Proxy
export http_proxy=''

#Pager
export LESS=-R
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

#Eiffel
export ISE_EIFFEL=$HOME/eiffel/Eiffel63
export ISE_PLATFORM=linux-x86
export GOBO=$HOME/eiffel/gobo
export GOBO_CC=gcc
export GOBO_EIFFEL=ise
export GOBO_OS=unix
export SAFE=$ISE_EIFFEL/library/safe
export SAFE_LIB=$SAFE/lib
export SAFE_APPL=$SAFE/applications
export SAFE_KERNEL=$SAFE_LIB/kernel
export EFM=$SAFE_LIB/efm
export ECURSES=$SAFE_LIB/ecurses
export ECLI=$SAFE_LIB/ecli
export EPOM=$SAFE_LIB/epom
export LOG4E=$HOME/eiffel/log4e
export VAMPEER=$HOME/eiffel/vampeer

# Path
export PATH="$PATH:/home/oli/scripts:/opt/e17/bin:/usr/local/bin:$ISE_EIFFEL/studio/spec/$ISE_PLATFORM/bin:$GOBO/bin"
export MANPATH=$MANPATH:/usr/local/share/man
export PYTHONPATH="/home/oli/scripts:/home/oli/openerp/server/trunk"

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
