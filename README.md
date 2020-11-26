# Ubuntu settings

## konsole
Install from software center.  
Run:
```
mkdir -p ~/.local/share/konsole && cd ~/.local/share/konsole
wget https://raw.githubusercontent.com/lykius/ubuntu-settings/master/konsole/lykius.profile
cd ~/.config
wget https://raw.githubusercontent.com/lykius/ubuntu-settings/master/konsole/konsolerc
```
Set the default terminal application with the command `sudo update-alternatives --config x-terminal-emulator`.

## /etc/fstab
Generally, add the following line to `/etc/fstab` to mount automatically a partition:
```
UUID=XXXXXXXXXX /PATH/TO/MNTDIR FILE_SYSTEM defaults 0 2
```
To mount properly a NTFS partition, use the following line:
```
UUID=XXXXXXXXXX /PATH/TO/MNTDIR ntfs defaults,auto,utf8,umask=000,dmask=022,fmask=133,uid=1000,gid=1000 0 0
```
The UUID of a partition can be obtained with the command `sudo blkid`.

## KeePass 2
Run `sudo apt install keepass2`.

## gTile
gTile can be installed using a browser from [gnome extensions](https://extensions.gnome.org/), follow instructions there to setup gnome extensions.  
After installing gTile, download the file `gtile.txt` from this repository and run `dconf load /org/gnome/shell/extensions/gtile/ < gtile.txt`.

## gnome-tweak-tool
Run `sudo apt install gnome-tweak-tool`.  
It's needed to define workspaces, to enable the option "Windows -> Center New Windows" and to configure Extensions (like gTile).

## dconf-editor
Run `sudo apt install dconf-editor`.  
To hide the dock, go to `org/gnome/shell/extensions/dash-to-dock` and disable "autohide", "dock-fixed" and "intellihide".

## Vim
Run `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`.  
Copy `.vimrc` file from this repository in `~`.  
Open `vim` and run `:PluginInstall` to install plugins.

## pyenv
Follow instructions [here](https://github.com/pyenv/pyenv#basic-github-checkout) and [here](https://github.com/pyenv/pyenv/wiki#suggested-build-environment).

## poetry
Follow instructions [here](https://python-poetry.org/docs/#installation).  
You need to logout and then login to add poetry to the PATH.  
After that, run `poetry config virtualenvs.in-project true`.

## VSCode
Copy settings files from this repository in `~/.config/Code/User`.  
Follow [these instructions](https://hdd512mb.wordpress.com/2019/03/06/visual-studio-code-is-unable-to-watch-for-file-changes-in-this-large-workspace-in-linux-os/).

## NVIDIA Drivers and CUDA
### Drivers
Add drivers repository with `sudo add-apt-repository ppa:graphics-drivers/ppa` and `sudo apt update` (sometimes a reboot was required).  
Then run `ubuntu-drivers devices` to get the recommended version (e.g. 450).  
Finally, install with `sudo apt install nvidia-driver-450` and reboot.
### CUDA and cuDNN
Download CUDA run file from [here](https://developer.nvidia.com/cuda-toolkit-archive). Do not install drivers during the setup.  
Download cuDNN tar file from [here](https://developer.nvidia.com/cudnn) and follow instructions [here](https://docs.nvidia.com/deeplearning/cudnn/install-guide/index.html#installlinux-tar).
### Use intel graphics for display and GPUS only for CUDA
Use the modified version of `prime-select` from [here](https://github.com/lperez31/prime-select-hybrid).

## SSH setup
Install ssh with `sudo apt install openssh-server`.  
To connect without password, follow these steps:
```
1. ssh-keygen
2. ssh-copy-id -i ~/.ssh/id_rsa.pub user@remote-host
```
