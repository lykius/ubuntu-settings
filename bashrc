# If not running interactively, don't do anything
[ -z "$PS1" ] && return

HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize

export PS1="\n\[$(tput sgr0)\]\[\033[38;5;135m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\n\[$(tput sgr0)\]\[\033[38;5;141m\][\u]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;124m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

alias ls='ls --color'
export LS_COLORS='di=1;93:ln=4:ex=92'
alias la='ls -A'
alias ll='ls -Al'

# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/dev
# export VIRTUALENVWRAPPER_PYTHON=$(which python3)
# source $(which virtualenvwrapper.sh)

alias python='python3'
alias py='python3'
alias pip='pip3'
# alias mkpj='mkproject -p $(which python3)'
# alias cdpj='cdproject'

alias arpscan='sudo arp-scan --interface=INTERFACE --localnet'
