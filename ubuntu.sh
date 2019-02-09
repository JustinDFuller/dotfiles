#!/bin/sh

# This setup file is intended for an ubuntu system.
# It should download everything that I use 

echo "Beginning apt-get installations"
sudo apt-get update -q
sudo apt-get install vim -yq
sudo apt-get install firefox -yq
sudo apt-get install git -yq
sudo apt-get install haskell-platform -yq
sudo apt-get install xclip -yq
sudo apt-get install postgresql postgresql-contrib -yq
sudo apt-get install libpq-dev -yq # required for postgres-simple
sudo apt-get install mysql-server -yq
sudo apt-get install libmysqlclient-dev -yq # required for mysql-simple
sudo apt-get install libpcre3 libpcre3-dev -yq # required for mysql-simple
sudo apt-get install build-essential cmake -yq # for youcompleteme
sudo apt-get install python-dev python3-dev -yq
sudo apt-get install wget -yq
echo "Finished with apt-get installations"

echo "Installing Node Version Manager"
mkdir -p ~/.nvm ~/nvm # I've seen it install nvm in both these folders. Ensure they exist.
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# Install latest node version
nvm install `nvm ls-remote | tail -1 | xargs`
npm i -g npm@latest
echo "Finished installing nvm, node, and npm"

echo "Generating Github SSH key"
ssh-keygen -t rsa -b 4096 -C "justindanielfuller@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
xclip -sel clip < ~/.ssh/id_rsa.pub
echo "Github SSH Key copied to clipboard"
echo "Opening github settings page in the default browser"
xdg-open https://github.com/settings/keys

# Haskell related stuff
cabal update
cabal install hlint
cabal install tasty-hunit
cabal install sqlite-simple
cabal install mysql-simple
cabal install postgresql-simple

# Database setup
echo "Configuring postgresql"
sudo service postgresql start
echo "Create a postgres user with: sudo -u postgres createuser <username>"
echo "Create a postgres database with: sudo -u postgres createdb <dbname>"
echo "Create a postgres password with: $ sudo -u postgres psql"
echo "psql=# alter user <username> with encrypted password '<password>';"
echo "Grant postgres privileges with: psql=# grant all privileges on database <dbname> to <username> ;"
echo "Configuring postgres to start on boot"
sudo update-rc.d postgresql enable

echo "Configuring mysql"
sudo /etc/init.d/mysql start
mysql_secure_installation
echo "Test mysql connection with: mysql -u root -p"
echo "Configuring mysql to start on boot"
sudo update-rc.d mysql defaults

# Vim related items
# This will save .vimrc to home directory
wget https://raw.githubusercontent.com/JustinDFuller/setup/master/.vimrc -O ~/.vimrc
# Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# This will install all plugins
vim +PluginInstall +qall
# Compile youcompleteme
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
