# If not running interactively, don't do anything
[ -z "$PS1" ] && return

HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize
stty -ixon

current_venv_and_branch() {
    venv=$(echo $VIRTUAL_ENV | rev | cut -d '/' -f2 | rev)
    branch=$(git branch 2> /dev/null | grep \* | cut -d ' ' -f2)
    if [ -z $venv ] && [ -z $branch ]
    then
        echo ''
    else
        echo '('$venv':'$branch') '
    fi
}

export PS1="\n\[\033[38;5;141m\]\u@\h\[$(tput sgr0)\]:\[\033[38;5;6m\]\w\[$(tput sgr0)\]\n\$(current_venv_and_branch)\[\033[38;5;196m\]\\$\[$(tput sgr0)\] "

alias ls='ls --color'
export LS_COLORS='di=1;93:ln=4:ex=92'
alias la='ls -A'
alias ll='ls -Alh'

alias python='python3'
alias py='python3'
alias pyt='py -m pytest -v'
alias pip='pip3'

export PIP_REQUIRE_VIRTUALENV=true
export VIRTUAL_ENV_DISABLE_PROMPT=1
workon(){
    source ~/dev/$1/.venv/bin/activate
    cd ~/dev/$1
}
_workon_completions()
{
    dirs=$(find ~/dev -maxdepth 2 -type d | awk -F "dev/" '{print $2}')
    COMPREPLY=($(compgen -W "$dirs" "${COMP_WORDS[1]}"))
}
complete -F _workon_completions workon
alias deact='deactivate'
alias cdpj='cd $(which python | cut -d. -f1)'

# sshfs() { sshfs USER@HOST:/remote/path /local/path ; }
# alias nsmi='watch nvidia-smi'
# cuda() { export CUDA_VISIBLE_DEVICES="$1" ; }
# alias tboard='tensorboard --logdir . --host 137.204.59.222'
# alias tmuxn='tmux new -s'
# alias tmuxa='tmux a -t'
# alias chm='sudo chmod -R ugo-rwx,u+rwX,go+rX'
# cheat() { curl cheat.sh/$1 ; }

export-cuda()
{
    echo export PATH=/usr/local/cuda-$1/bin'${PATH:+:${PATH}}' ;
    echo export LD_LIBRARY_PATH=/usr/local/cuda-$1/lib64'${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' ;
}
