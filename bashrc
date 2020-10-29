# If not running interactively, don't do anything
[ -z "$PS1" ] && return

HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize
stty -ixon

current_venv_and_branch() {
    venv=$(echo $VIRTUAL_ENV | rev | cut -d '/' -f1 | rev)
    branch=$(git branch 2> /dev/null | grep \* | cut -d ' ' -f2)
    if [ -z $venv ] && [ -z $branch ]
    then
        echo ''
    else
        echo '('$venv':'$branch') '
    fi
}

export PS1="\n\[\033[38;5;141m\]\u@\h\[$(tput sgr0)\]:\[\033[38;5;6m\]\w\[$(tput sgr0)\]\n\$(current_venv_and_branch)\[\033[38;5;124m\]\\$\[$(tput sgr0)\] "

alias ls='ls --color'
export LS_COLORS='di=1;93:ln=4:ex=92'
alias la='ls -A'
alias ll='ls -Alh'

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

# alias arpscan='sudo arp-scan --interface=INTERFACE --localnet'
# sshfs() { sshfs USER@HOST:/remote/path /local/path ; }
# alias nsmi='watch nvidia-smi'
# cuda() { export CUDA_VISIBLE_DEVICES="$1" ; }
# alias tboard='tensorboard --logdir . --host 137.204.59.222'
# alias tmuxn='tmux new -s'
# alias tmuxa='tmux a -t'
# alias chm='sudo chmod -R ugo-x,u+rwX,go+rX,go-w'
# alias docker_killall='docker stop `docker ps -a -q` && docker rm `docker ps -a -q`'
# alias docker_rmall='docker rmi `docker image ls -q`'
# alias img2vid='ffmpeg -framerate 10 -start_number 0 -i images/%06d.png -c:v libx264 video.mp4'
# alias genpalette='ffmpeg -i video.mp4 -vf "fps=10,palettegen" palette.png'
# alias vid2gif='ffmpeg -i video.mp4 -i palette.png -filter_complex "fps=10,paletteuse" scene.gif'
