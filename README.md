# Ubuntu settings

## Terminal
Background color: `RGB(60,50,50)` (or in hex `#3c3232`).  
Font: Ubuntu Mono Regular.

## /etc/fstab
To mount properly a NTFS partition, add the following line to `/etc/fstab`:
```
UUID=XXXXXXXXXX /PATH/TO/MNTDIR ntfs defaults,auto,utf8,umask=000,dmask=022,fmask=133,uid=1000,gid=1000 0 0
```
Generally, the line to mount a partition is:
```
UUID=XXXXXXXXXX /PATH/TO/MNTDIR FILE_SYSTEM defaults 0 2
```
The UUID of the partition can be obtained with the command `sudo blkid`.

## KeePass 2
Run `sudo apt install keepass2`.

## gTile
gTile can be installed using a browser from [gnome extensions](https://extensions.gnome.org/).  
Follow instructions there to install the necessary plugin and proxy app.

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

## Virtualenvwrapper
Install with `sudo pip3 install virtualenvwrapper` and uncomment related lines in `.bashrc` file.  
Edit file `~/.virtualenvs/postmkvirtualenv` accordingly to the file in this repository.  
If you need to use CUDA in a virtualenv, use `postactivate` and `postdeactivate` scripts similar to the ones in this repository.

## VSCode
Copy settings files from this repository in `~/.config/Code/User`.  
Follow [these instructions](https://hdd512mb.wordpress.com/2019/03/06/visual-studio-code-is-unable-to-watch-for-file-changes-in-this-large-workspace-in-linux-os/).

## NVIDIA Drivers and CUDA
Add drivers repository with `sudo add-apt-repository ppa:graphics-drivers/ppa` and `sudo apt update` (sometimes a reboot was required).  
Then run `ubuntu-drivers devices` to get the recommended version (e.g. 450).  
Finally, install with `sudo apt install nvidia-driver-450` and reboot.  
Download CUDA run file from [here](https://developer.nvidia.com/cuda-toolkit-archive). Do not install drivers during the setup.  
Download cuDNN tar file from [here](https://developer.nvidia.com/cudnn) and follow instructions [here](https://docs.nvidia.com/deeplearning/cudnn/install-guide/index.html#installlinux-tar).

## SSH setup
Install ssh with `sudo apt install openssh-server`.  
To connect without password, follow these steps:
```
1. ssh-keygen
2. ssh-copy-id -i ~/.ssh/id_rsa.pub user@remote-host
```
