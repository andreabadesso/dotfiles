#!bin/bash

# Installing dotfiles
git clone git@github.com:andreabadesso/dotfiles.git ~/.dotfiles
ln -s ~/.dotfiles/.vim ~/.vim
ln -s ~/.vim/.vimrc ~/.vimrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
read -rsp $'Opening Vim, type :BundleInstall and wait for it to finish.\n' -n1 key
vim

# Powerline fonts
git clone git@github.com:powerline/fonts.git ~/Downloads/fonts
cd ~/Downloads/fonts
sh install.sh

# Returning to dotfiles folder
cd ~/.dotfiles

rm -rf ~/Downloads/fonts
if [[ "$OSTYPE" == "linux-gnu" ]]; then
	sh install_linux.sh
elif [[ "$OSTYPE" == "darwin"* ]]; then
	sh install_osx.sh
else
	echo "Unrecognized OS, nothing to do."
	exit 1
fi

# Installing YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe/
sh install.sh --clang-completer

# Installing Node Version Manager
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash

# Installing Oh-My-Zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
