# If not running interactively, don't do anything
[ -z "$PS1" ] && return

HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize

current_branch() {
    branch=$(git branch 2> /dev/null | grep \* | cut -d ' ' -f2)
    if [ -z $branch ]
    then
        echo ''
    else
        echo '꜓ '$branch' '
    fi
}

current_virtual_env() {
    venv=$(echo $VIRTUAL_ENV | rev | cut -d '/' -f1 | rev)
    if [ -z $venv ]
    then
        echo ''
    else
        echo '('$venv') '
    fi
}

export PS1="\n\[$(tput sgr0)\]\[\033[38;5;141m\][\u] @\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]\[\033[38;5;63m\]\[\033[48;5;220m\]\h\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;141m\]:\w\[$(tput sgr0)\]\[\033[38;5;15m\]\n\$(current_virtual_env)\$(current_branch)\[$(tput sgr0)\]\[\033[38;5;124m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

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
alias pyt='py -m pytest -v'
alias pyc='pycodestyle'
alias pip='pip3'
# alias mkpj='mkproject -p $(which python3)'
# alias cdpj='cdproject'
# alias deact='deactivate'
export PIP_REQUIRE_VIRTUALENV=true
export VIRTUAL_ENV_DISABLE_PROMPT=1
alias jnote='jupyter-notebook'

alias arpscan='sudo arp-scan --interface=INTERFACE --localnet'
raspifs() { sshfs pi@"$1":/home/pi/dev /home/lykius/dev/raspberry ; }
