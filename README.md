# Ubuntu settings

## KeePass 2
Run `sudo apt install keepass2`.

## Terminal
Background color: `RGB(60,50,50)` (or in hex `#3c3232`).  
Font: Ubuntu Mono Regular.

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
Replace `~/.virtualenvs/postactivate` file with the one from this repository.

## VSCode
Copy settings files from this repository in `~/.config/Code/User`.
