export ZSH=$HOME/.oh-my-zsh
export ZSH_SCRIPTS=$HOME/.zsh-scripts

$ZSH_SCRIPTS/motd

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# ZSH_THEME="amuse"
# ZSH_THEME="terminalparty"
# ZSH_THEME="ys"
ZSH_THEME="spaceship"
source ~/.zsh-custom/themes/spaceship.zsh-theme

HYPHEN_INSENSITIVE="true"
DISABLE_LS_COLORS="false"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="false"
HIST_STAMPS="yyyy-mm-dd"
ZSH_CUSTOM=$HOME/.zsh-custom

# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

# User configuration
export PATH="$PATH:/usr/local/share/npm/bin:/usr/local/share/npm/bin:/home/matt/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/local/packer:/snap/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

alias ls="colorls --sd"
alias ll="colorls -l"
alias lc="colorls -r"
alias gs="colorls --gs"
alias ols="ls"
alias oll="ls -l"
alias ola="ls -al"
alias i="feh --scale-down --auto-zoom"
alias wait="echo 'Press any key to continue...';read -k1 -s"

# Connection aliases
alias cs="ssh matthew.parlette@`nslookup cs-matthew-parlette 192.168.86.1 | awk '/^Address: / { print $2 }'`"
alias mb="cs"
alias cs2="ssh matthew.parlette@`nslookup cs-matthew-parlette-2 192.168.86.1 | awk '/^Address: / { print $2 }'`"
alias mb2="cs2"

# Vagrant aliases
alias vup="vagrant up && echo 'Press any key to shutdown...';read -k1 -s;vagrant halt"

export SHELL="/bin/zsh"

# NVM
export NVM_DIR=~/.nvm
# In general, (( $+param )) returns true if param is set.
# $commands is an associative array that lists commands.
# (( $+commands[command-name] )) returns true if the key 'command-name' exists.
if type brew > /dev/null ; then
	source $(brew --prefix nvm)/nvm.sh
fi

# Kubernetes
if [[ -x `which kubectl 2>&1 > /dev/null` ]]; then
	source <(kubectl completion zsh)
fi

# RVM
if [[ `uname` == 'Linux' ]]; then
  
else
  
fi

if [[ $OSTYPE == darwin* ]]; then
  # Mac

  ## RVM
  export PATH="$PATH:$HOME/.rvm/bin/rvm"
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
  # Fix some bogus python3 targeting with macos
  export BYOBU_PYTHON=/usr/local/bin/python3
  # Fix some dumb stuff with libxml2 on macos
  export PATH="/usr/local/opt/libxml2/bin:$PATH"

  ## Go
  export GOPATH="$HOME/go"
else
  # Linux
  ## RVM
  export PATH="$PATH:/usr/share/rvm/bin"

  ## Go
  export GOPATH="/home/matt/src/go"
fi

export PATH="$PATH:$(go env GOPATH)/bin"

# i3

if [[ $DESKTOP_SESSION == i3 ]]; then

fi

# Yarn
export PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"
