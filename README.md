# Ubuntu settings

## Terminal
Background color: `RGB(60,50,50)` (or in hex `#3c3232`).  
Font: Ubuntu Mono Regular.

## /etc/fstab
To mount properly a NTFS partition, add the following line to `/etc/fstab`:
```
# <file system> <mount point>  <type>  <options>                                                          <dump>  <pass>
UUID=XXXXXXXXXX path/to/mntdir ntfs    defaults,auto,utf8,umask=000,dmask=022,fmask=133,uid=1000,gid=1000 0       0
```
The UUID of the partition can be obtained with the command `lsblk -f`.

## KeePass 2
Run `sudo apt install keepass2`.

## gTile
gTile can be installed using a browser from [this link](https://extensions.gnome.org/).
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

## NVIDIA Drivers
Add drivers repository with `sudo add-apt-repository ppa:graphics-drivers/ppa` and `sudo apt update` (sometimes a reboot was required).
Then run `ubuntu-drivers devices` to get the recommended version (e.g. 450).
Finally, install with `sudo apt install nvidia-drivers-450` and reboot.
