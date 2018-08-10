# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Path to zsh scripts directory
export ZSH_SCRIPTS=$HOME/.zsh-scripts

$ZSH_SCRIPTS/motd

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

# ZSH Theme
# ZSH_THEME="amuse"
# ZSH_THEME="terminalparty"
# ZSH_THEME="ys"
ZSH_THEME="spaceship"
source ~/.zsh-custom/themes/spaceship.zsh-theme

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
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.zsh-custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="$PATH:/usr/local/share/npm/bin:/usr/local/share/npm/bin:/home/matt/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/local/packer:/snap/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
# source $ZSH_SCRIPTS/salt.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls="colorls --sd"
alias ll="colorls -l"
alias lc="colorls -r"
alias gs="colorls --gs"
alias ols="ls"
alias oll="ls -l"
alias ola="ls -al"
alias i="feh --scale-down --auto-zoom"

export SHELL="/bin/zsh"

# NVM
export NVM_DIR=~/.nvm
# In general, (( $+param )) returns true if param is set.
# $commands is an associative array that lists commands.
# (( $+commands[command-name] )) returns true if the key 'command-name' exists.
if (( $+commands[brew] )) ; then
	source $(brew --prefix nvm)/nvm.sh
fi

# Kubernetes
if (( $+commands[kubectl] )) ; then
	source <(kubectl completion zsh)
fi

# RVM
if [[ `uname` == 'Linux' ]]; then
  export PATH="$PATH:/usr/share/rvm/bin"
fi

if [[ $OSTYPE == darwin* ]]; then
  # export PATH="$PATH:$HOME/.rvm/bin/rvm"
  source ~/.rvm/scripts/rvm
fi

# Go
if [[ $OSTYPE == darwin* ]]; then
  export GOPATH="$HOME/go"
else
  export GOPATH="/home/matt/src/go"
fi

export PATH="$PATH:$(go env GOPATH)/bin"

# i3

if [[ $DESKTOP_SESSION == i3 ]]; then

fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/matthew.parlette/Downloads/google-cloud-sdk 2/path.zsh.inc' ]; then source '/Users/matthew.parlette/Downloads/google-cloud-sdk 2/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/matthew.parlette/Downloads/google-cloud-sdk 2/completion.zsh.inc' ]; then source '/Users/matthew.parlette/Downloads/google-cloud-sdk 2/completion.zsh.inc'; fi
