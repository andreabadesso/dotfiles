#!bin/bash

# Requires brew to be installed.

brew update
brew install caskroom/cask/brew-cask

# Casks:
brew cask install iterm2
brew cask install google-chrome-canary

# Tools
brew install tmux
brew install zsh
brew install macvim

# CMAKE for YouCompleteMe
brew install cmake

# Powerline fonts
git clone git@github.com:powerline/fonts.git ~/Downloads/fonts
cd ~/Downloads/fonts
sh install.sh
rm -rf ~/Downloads/fonts

# Installing dotfiles
git@github.com:andreabadesso/dotfiles.git ~/.dotfiles
ln -s ~/.dotfiles/.vim ~/.vim
ln -s ~/.vim/.vimrc ~/.vimrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
read -rsp $'Opening MacVim, type :BundleInstall and wait for it to finish.\n' -n1 key
mvim

# Installing YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe/
sh install.sh --clang-completer

# Installing Node Version Manager
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash

# Oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

