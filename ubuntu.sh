#!/bin/sh

# This setup file is intended for an ubuntu system.
# It should download everything that I use 

sudo apt-get update
sudo apt-get install firefox -y
sudo apt-get install git -y
sudo apt-get install haskell-platform -y
sudo apt-get install node -y
sudo apt-get install xclip -y
sudo apt-get install postgresql postgresql-contrib -y
sudo apt-get install libpq-dev -y # required for postgres-simple
sudo apt-get install mysql-server -y
sudo apt-get install libmysqlclient-dev -y # required for mysql-simple
sudo apt-get install libpcre3 libpcre3-dev -y # required for mysql-simple
sudo apt-get install build-essential cmake -y # for youcompleteme
sudo apt-get install python-dev python3-dev -y

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
