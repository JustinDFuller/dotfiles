sudo apt-get update
sudo apt-get install firefox
sudo apt-get install git
sudo apt-get install haskell-platform
sudo apt-get install node
sudo apt-get install xclip
sudo apt-get install mysql-server
sudo apt-get install postgresql postgresql-contrib

echo "Generating Github SSH key"
ssh-keygen -t rsa -b 4096 -C "justindanielfuller@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
xclip -sel clip < ~/.ssh/id_rsa.pub
echo "Github SSH Key copied to clipboard"
echo "Opening github settings page in the default browser"
xdg-open https://github.com/settings/keys

cabal update
cabal install hlint
cabal install tasty-hunit
cabal install sqlite-simple

sudo service postgresql start
echo "Create a postgres user with: sudo -u postgres createuser <username>"
echo "Create a postgres database with: sudo -u postgres createdb <dbname>"
echo "Create a postgres password with: $ sudo -u postgres psql"
echo "psql=# alter user <username> with encrypted password '<password>';"
echo "Grant postgres priveleges with: psql=# grant all privileges on database <dbname> to <username> ;"
