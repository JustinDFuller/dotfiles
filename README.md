# Dotfiles

Inspired by: https://drewdevault.com/2019/12/30/dotfiles.html

1. Navigate to $HOME: `cd ~`.
2. Turn it into a git repo: `git init`.
3. Add this repo as a remote: `git remote add origin git@github.com:JustinDFuller/dotfiles.git`.
4. Fetch the files `git fetch`.
5. Checkout the main branch `git checkout -f main`.
6. Reload the terminal and everything is there 👍

## Add a new file

If you want to add a file, you must force add it due to the `gitignore`. However, after that, it will stay tracked. `git add -f .tmux.conf`.
