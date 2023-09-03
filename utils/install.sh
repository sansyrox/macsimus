#!/bin/sh

set -o nounset # error when referencing undefined variable
set -o errexit # exit when command fails

installNeoVimMac() {
	brew install lua
	brew install neovim --HEAD
}

installnodemac() {
	brew install lua
	brew install node
	brew install yarn
}

installnodeubuntu() {
	sudo apt install nodejs
	sudo apt install npm
}

moveoldnvim() {
	echo "Not installing Macsimus"
	echo "Please move your ~/.config/nvim folder before installing"
	exit
}

installnodearch() {
	sudo pacman -S nodejs
	sudo pacman -S npm
}

installnodefedora() {
    sudo dnf install -y nodejs 
    sudo dnf install -y npm
}

installnode() {
	echo "Installing node..."
	[ "$(uname)" == "Darwin" ] && installnodemac
	[ -n "$(uname -a | grep Ubuntu)" ] && installnodeubuntu
	[ -f "/etc/arch-release" ] && installnodearch
	[ -f "/etc/fedora-release" ] && installnodefedora
	[ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ] && echo "Windows not currently supported"
	sudo npm i -g neovim
}

installpiponmac() {
	sudo curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	python3 get-pip.py
	rm get-pip.py
}

installpiponubuntu() {
	sudo apt install python3-pip >/dev/null
}

installpiponarch() {
	pacman -S python-pip
}

installpiponfedora() {
	sudo dnf install -y pip >/dev/nul
}

installpip() {
	echo "Installing pip..."
	[ "$(uname)" == "Darwin" ] && installpiponmac
	[ -n "$(uname -a | grep Ubuntu)" ] && installpiponubuntu
	[ -f "/etc/arch-release" ] && installpiponarch
	[ -f "/etc/fedora-release" ] && installpiponfedora
	[ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ] && echo "Windows not currently supported"
}

installpynvim() {
	echo "Installing pynvim..."
	pip3 install pynvim --user
}

installpacker() {
	git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
}

cloneconfig() {
	echo "Cloning Macsimus configuration"
	git clone https://github.com/sansyrox/macsimus.git ~/.config/nvim
	# mv $HOME/.config/nvim/init.lua $HOME/.config/nvim/init.lua.tmp
	# mv $HOME/.config/nvim/utils/init.lua $HOME/.config/nvim/init.lua
	# nvim -u $HOME/.config/nvim/init.lua +PackerInstall
	# rm $HOME/.config/nvim/init.lua
	# mv $HOME/.config/nvim/init.lua.tmp $HOME/.config/nvim/init.lua
}

asktoinstallnode() {
	echo "node not found"
	echo -n "Would you like to install node now (y/n)? "
	read answer
	[ "$answer" != "${answer#[Yy]}" ] && installnode
}

asktoinstallpip() {
	# echo "pip not found"
	# echo -n "Would you like to install pip now (y/n)? "
	# read answer
	# [ "$answer" != "${answer#[Yy]}" ] && installpip
	echo "Please install pip3 before continuing with install"
	exit
}

installonmac() {
	brew install ripgrep fzf ranger
	git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
	#npm install -g tree-sitter-cli
	rangerConfigOnMac
}

rangerConfigOnOthers() {
	sed 's/set\ preview_images\ false/set\ preview_images\ true/g' $HOME/.config/ranger/rc.conf
	sed 's/set\ preview_images_method\ w3m/set\ preview_images_method\ ueberzug/g' $HOME/.config/ranger/rc.conf
	sed 's/set\ draw_borders\ false/set\ draw_borders\ true/g' $HOME/.config/ranger/rc.conf
	git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
	echo "default_linemode devicons" >> $HOME/.config/ranger/rc.conf
}

rangerConfigOnMac() {
	sed 's/set\ preview_images\ false/set\ preview_images\ true/g' $HOME/.config/ranger/rc.conf
	sed 's/set\ preview_images_method\ w3m/set\ preview_images_method\ iterm2/g' $HOME/.config/ranger/rc.conf
	sed 's/set\ draw_borders\ false/set\ draw_borders\ true/g' $HOME/.config/ranger/rc.conf
	git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
	echo "default_linemode devicons" >> $HOME/.config/ranger/rc.conf
}

rangerConfig() {
	if [ "$(uname)" == "Darwin" ]; 
	then 
		rangerConfigOnMac
	else 
		rangerConfigOnOthers
	fi
}

pipinstallueberzug() {
	which pip3 >/dev/null && pip3 install ueberzug || echo "Not installing ueberzug pip not found"
}

installonubuntu() {
	sudo apt install ripgrep fzf ranger
	sudo apt install libjpeg8-dev zlib1g-dev python3-dev libxtst-dev
	pip3 install ueberzug
	pip3 install neovim-remote
	npm install -g tree-sitter-cli
	rangerConfigOnOthers
}

installonarch() {
	sudo pacman -S ripgrep fzf ranger
	which yay >/dev/null && yay -S python-ueberzug-git || pipinstallueberzug
	pip3 install neovim-remote
	npm install -g tree-sitter-cli
	rangerConfigOnOthers
}

installonfedora() {
    sudo dnf groupinstall "X Software Development"
    sudo dnf install -y fzf ripgrep ranger
    pip3 install wheel ueberzug
		rangerConfigOnOthers
}

installextrapackages() {
	[ "$(uname)" == "Darwin" ] && installonmac
	[ -n "$(uname -a | grep Ubuntu)" ] && installonubuntu
	[ -f "/etc/arch-release" ] && installonarch
	[ -f "/etc/fedora-release" ] && installonfedora
	[ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ] && echo "Windows not currently supported"
	pipinstallueberzug
}

# Welcome
echo 'Installing Macsimus'

echo 'Installing Base version of Neovim'
which nvim >/dev/null && echo "Base Neovim already installed" || installNeoVimMac

# move old nvim directory if it exists
[ -d "$HOME/.config/nvim" ] && moveoldnvim

# install pip
which pip3 >/dev/null && echo "pip installed, moving on..." || asktoinstallpip

# install node and neovim support
which node >/dev/null && echo "node installed, moving on..." || asktoinstallnode

# install pynvim
pip3 list | grep pynvim >/dev/null && echo "pynvim installed, moving on..." || installpynvim

#if [ -a "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
#	echo 'packer already installed'
#else
#	installpacker
#fi

if [ -a "$HOME/.config/nvim/init.lua" ]; then
	echo 'nvcode already installed'
else
	# clone config down
	cloneconfig
	# echo 'export PATH=$HOME/.config/nvim/utils/bin:$PATH' >>~/.zshrc
	# echo 'export PATH=$HOME/.config/nvcode/utils/bin:$PATH' >>~/.bashrc
fi

echo "Installing supplementary packages"
installextrapackages

# echo "I also recommend you add 'set preview_images_method ueberzug' to ~/.config/ranger/rc.conf"

# echo 'export PATH=/home/$USER/.config/nvcode/utils/bin:$PATH appending to zshrc/bashrc'

