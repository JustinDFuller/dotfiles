!#/bin/bash

# This installation file is meant to run on a chromebook running chromeos.

# Install crouton and create an alias
curl -L https://goo.gl/fd3zc -o ~/Downloads/crouton
sudo sh ~/Downloads/crouton -t xfce
echo 'alias crouton="sudo startxfce4"' >> ~/.bash_profile

# Install chromebrew
curl -Ls https://raw.github.com/skycocker/chromebrew/master/install.sh | bash

# Crew installs
crew install nvm

source ~/.bashrc
