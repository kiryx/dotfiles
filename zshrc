# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bureau"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

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
plugins=(git z vi-mode history-substring-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey "$terminfo[cuu1]" history-substring-search-up
bindkey "$terminfo[cud1]" history-substring-search-down

export KEYTIMEOUT=1

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

alias l='ls -AlhF'
alias swapkeys='setxkbmap -option caps:swapescape'

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source /usr/bin/virtualenvwrapper.sh
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i


# Git aliases
alias ga='git add'
alias gb='git branch'
alias gca='git commit --amend'
alias gcaa='git commit --amend -a'
alias gc='git commit'
alias gd='git diff'
alias gf='git fetch'
alias gfu='git fetch upstream'
alias gfum='git fetch upstream master'
alias gg='git grep -n'
alias gh='git log --color --decorate'
alias gho='git log --color --decorate --oneline'
alias ght='git --no-pager log -20 --oneline --all --graph --decorate'
alias gl='git pull'
alias glo='git pull origin'
alias glom='git pull origin master'
alias glum='git pull upstream master'
alias go='git checkout'
alias got='git checkout --track'
alias gp='git push'
alias gpo='git push origin'
alias gpom='git push origin master'
alias gr='git remote'
alias gs='git status'
alias ge='git rebase'

# Docker aliases
alias d='docker'
alias dstop='docker stop $(docker ps -aq)'
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dm='docker-machine'
alias dms='docker-machine start'
alias dmsd='docker-machine start default'
alias dmed='eval "$(docker-machine env default)"'

# Virtualenv aliases
alias wo='workon'
alias de='deactivate'
alias mkv='mkvirtualenv'
alias rmv='rmvirtualenv'
alias lsv='lsvirtualenv'
export WORKON_HOME=~/env

# Lastpass copy password to clipboard
p () {
    lpass show -p "$1" | xclip -sel clip
}

pipr () {
    pip uninstall "$1" -y
    pip install -e "file://${HOME}/src/${1}#egg=${1}"
}

# Grep colors and line numbers by default
alias grep='grep -n --color'

alias ssh='TERM=xterm-color ssh'

# Isort alias
alias is='isort -rc **/*.py'

# Navigation aliases
alias b='cd ..'
# Navigate to home
alias h='cd'
# Jump between last two directories
alias j='cd -'

# Tree alias
alias t='tree'
alias tl='tree -L'

# Tea alias
alias tea='sleep 180; notify-send "Tea\nTea\nTea"'

# Browser alias
alias o='chromium'

# Edit alias
alias e='gvim'

alias beep='aplay -q ~/.i3/beep.wav'

# History appendend locally after logout
setopt no_share_history
setopt APPEND_HISTORY

# Paths
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
export PATH=$PATH:$HOME/.local/bin
export C_INCLUDE_PATH=$HOME/.local/include
export CPLUS_INCLUDE_PATH=$HOME/.local/include
export LD_LIBRARY_PATH=$HOME/.local/lib
# export PYTHONPATH=$HOME/.local/lib/python2.7/site-packages:$PYTHONPATH

# GPG key
export GPGKEY=3745866A

function zle-line-init zle-keymap-select {
    VIM_NORMAL_PROMPT="%{$fg_bold[yellow]%}>>%{$reset_color%}"
    VIM_INS_PROMPT="> "
    PS1="`basename \"$VIRTUAL_ENV\"`${${KEYMAP/vicmd/$VIM_NORMAL_PROMPT}/(main|viins)/$VIM_INS_PROMPT}$_LIBERTY "
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
