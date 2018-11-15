#!/bin/sh

# This setup file is intended for a MAC OSX system.
# It should download everything that I use

# Install basic xcode tools
xcode-select --install

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Iterm2
curl -O https://iterm2.com/downloads/stable/iTerm2-3_2_5.zip
unzip iTerm2-3_2_5.zip
rm -rf ./iTerm2-3_2_5.zip
mv iTerm.app/ /Applications/
spctl --add /Applications/iTerm.app/

# Postman
curl -O https://dl.pstmn.io/download/latest/osx
unzip osx
rm osx
mv Postman.app /Applications/

# ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Brew install many things
brew install vim
brew install homebrew/cask-versions/firefox-nightly
brew install haskell-stack
brew install cabal-install
brew install postgresql
brew install mysql
brew install nvm
brew install cmake # For you-complete-me
brew install wget
brew install redis
brew install watchman

# Copy base files from repo
curl https://raw.githubusercontent.com/JustinDFuller/setup/master/.vimrc > ~/.vimrc
curl https://raw.githubusercontent.com/JustinDFuller/setup/master/.gitconfig > ~/.gitconfig
curl https://raw.githubusercontent.com/JustinDFuller/setup/master/.zshrc > ~/.zshrc
curl https://raw.githubusercontent.com/JustinDFuller/setup/master/.bash_profile > ~/.bash_profile

# Setting up NVM
mkdir ~/.nvm
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
# Install latest node version
nvm install `nvm ls-remote | tail -1 | xargs`
npm i -g npm@latest

# Getting github key
ssh-keygen -t rsa -b 4096 -C "justindanielfuller@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub

# Setting up mysql
brew services start mysql
mysql_secure_installation

# Setting up postgresql
brew services start postgresql

# Haskell related stuff
cabal update
cabal install hlint
cabal install tasty-hunit
cabal install sqlite-simple
cabal install mysql-simple
cabal install postgresql-simple

# Redis
brew services start redis

# VScode
curl -O https://az764295.vo.msecnd.net/insider/5f24c93878bd4bc645a4a17c620e2487b11005f9/VSCode-darwin-insider.zip
unzip VSCode-darwin-insider.zip
rm VSCode-darwin-insider.zip
spctl --add /Applications/Visual\ Studio\ Code\ -\ Insiders.app

# Vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
(cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer)

# NPM Globals
npm install -g yarn expo-cli react-native-cli

# Make the dock have only what I need
defaults write com.apple.dock persistent-apps -array '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Firefox Nightly.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Visual Studio Code - Insiders.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Iterm.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock tilesize -int 32
killall Dock
