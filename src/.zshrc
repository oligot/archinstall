# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="spaceship"

SPACESHIP_PROMPT_ADD_NEWLINE="false"
SPACESHIP_PROMPT_SEPARATE_LINE="false"
# https://denysdovhan.com/spaceship-prompt/docs/Options.html#order
SPACESHIP_PROMPT_ORDER=(
time          # Time stamps section
user          # Username section
dir           # Current directory section
host          # Hostname section
git           # Git section (git_branch + git_status)
package       # Package version
exec_time     # Execution time
line_sep      # Line break
vi_mode       # Vi-mode indicator
jobs          # Background jobs indicator
exit_code     # Exit code section
char          # Prompt character
)

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(docker kubectl git git-extras go fasd mvn npm tmux history-substring-search vi-mode thefuck archlinux systemd extract yarn sudo)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="$PATH:$HOME/bin:/usr/local/bin:/usr/lib/tracker:$ERL_G/bin:/opt/maven/bin:/usr/local/go/bin:$GOPATH/bin:$HOME/.local/share/umake/bin:$HOME/Library/Android/sdk/platform-tools/:$HOME/.local/bin:$HOME/.cargo/bin"
export GOPATH=$HOME/go
export MANPATH=$MANPATH:/usr/local/share/man
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
export EDITOR="vim"
export BROWSER="firefox"
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'
# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"

#Pager
export LESS=-FSRX
export LESS_TERMCAP_mb=$'\E[01;31m'    # début de blink
export LESS_TERMCAP_md=$'\E[01;31m'    # début de gras
export LESS_TERMCAP_me=$'\E[0m'        # fin
export LESS_TERMCAP_so=$'\E[01;44;33m' # début de la ligne d`état
export LESS_TERMCAP_se=$'\E[0m'        # fin
export LESS_TERMCAP_us=$'\E[01;32m'    # début de souligné
export LESS_TERMCAP_ue=$'\E[0m'        # fin

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cat='bat'
alias df='df -h'
alias dodo='sudo /sbin/shutdown -h now'
alias du='du -h'
alias gdcw='git diff --cached -w' # Overwrite oh-my-zsh plugin
alias gdw='git diff -w' # Overwrite oh-my-zsh plugin
alias gpa='git add . && git commit -v && git push'
alias gstau='git stash push --include-untracked'
alias jc='sudo journalctl -u'
alias jcf='sudo journalctl -f -u'
alias ls='exa'
alias preview="fzf --preview 'bat --color=always {}'"
alias rm='rm -I'
alias s='yarn start'
alias sudo='sudo '
alias v='vim'
alias yupi='yarn upgrade-interactive --latest'

# Global aliases -- These do not have to be
# at the beginning of the command line.
alias -g L='| less'
alias -g G='| grep'
alias -g P='| python -m json.tool'

function mingz () { curl -sL wzrd.in/standalone/"$1"|uglifyjs -mc 2>/dev/null|gzip -c|wc -c;}

# zsh Options
setopt			   \
	autopushd 	   \
	correct		   \
	correctall	   \
	extendedglob	   \
	histignorealldups  \
	pushdminus         \
	pushdsilent        \
	pushdtohome	   \
	sharehistory

unsetopt ignore_eof	   \
	list_ambiguous

# Terminal title
case $TERM in
   xterm*|rxvt*|screen)
   precmd () {print -Pn "\e]0;%n@%m: %~\a"}
   preexec () { print -Pn "\e]0;%n@%m: $1\a" }
   ;;
esac

# Source environment variables
for i in $HOME/.env/*; do
    source $i
done

# Source local environment variables
if [ -d "$HOME/.env.local" ]; then
    for i in $HOME/.env.local/*; do
        source $i
    done
fi

bindkey '^R' history-incremental-search-backward
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
eval $(thefuck --alias)

# Persistent rehash
# https://wiki.archlinux.org/index.php/zsh#Persistent_rehash
zstyle ':completion:*' rehash true

[[ -s "/home/oli/.gvm/scripts/gvm" ]] && source "/home/oli/.gvm/scripts/gvm"

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/vault vault

# zplug

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "MichaelAquilina/zsh-you-should-use"
zplug "akarzim/zsh-docker-aliases"
zplug "denisidoro/navi"
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
zplug "changyuheng/fz", defer:1
zplug "rupa/z", use:z.sh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
