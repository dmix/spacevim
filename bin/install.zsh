#!/usr/bin/env zsh

# ------------------------------------------------------------
# SpaceVim Installer
# ------------------------------------------------------------

curl -sLf https://spacevim.org/install.sh | bash

# Dependencies
# ------------------------------------------------------------

gem install rubocop
sudo apt install tidy
sudo apt-get install shellcheck 
pip install vim-vint
pip install yamllint
pip install flake8
pip install proselint
npm install -g eslint
npm install -g jsonlint
npm install -g sass-lint
npm install -g stylelint
npm install -g diff-so-fancy
yarn global add tslint typescript

# Spelling word list
# ------------------------------------------------------------

cd ~/tmp
wget https://github.com/helmuthdu/vim/blob/master/spell/en.utf-8.spl
mkdir -p ~/.SpaceVim/spell
cp en.utf-8.spl ~/.SpaceVim/spell
