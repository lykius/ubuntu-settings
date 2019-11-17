# Ubuntu settings

## Terminal
Background color: `RGB(60,50,50)` (or in hex `#3c3232`).  
Font: Ubuntu Mono Regular.

## /etc/fstab
To mount properly a NTFS partition, add the following line to `/etf/stab`:
```
# <file system> <mount point>  <type>  <options>                                                          <dump>  <pass>
UUID=XXXXXXXXXX path/to/mntdir ntfs    defaults,auto,utf8,umask=000,dmask=022,fmask=133,uid=1000,gid=1000 0       0
```
The UUID of the partition can be obtained with the command `lsblk -f`.

## KeePass 2
Run `sudo apt install keepass2`.

## gnome-tweak-tool
Run `sudo apt install gnome-tweak-tool`.  
It's needed to define workspaces, to enable the option "Windows -> Center New Windows" and to configure Extensions (like gTile).

## dconf-editor
Run `sudo apt install dconf-editor`.  
To hide the dock, go to "org/gnome/shell/extensions/dash-to-dock" and disable "autohide", "dock-fixed" and "intellihide".

## Vim
Run `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`.  
Copy `.vimrc` file from this repository in `~`.  
Open `vim` and run `:PluginInstall` to install plugins.

## Virtualenvwrapper
Install with `sudo pip3 install virtualenvwrapper` and uncomment related lines in `.bashrc` file.  

## VSCode
Copy settings files from this repository in `~/.config/Code/User`.  
Follow [these instructions](https://hdd512mb.wordpress.com/2019/03/06/visual-studio-code-is-unable-to-watch-for-file-changes-in-this-large-workspace-in-linux-os/).
