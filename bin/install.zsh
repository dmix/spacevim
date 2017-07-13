#!/usr/bin/env zsh

# ------------------------------------------------------------
# dmix/SpaceVim Installer
# ------------------------------------------------------------

# Detect OS
# ------------------------------------------------------------
MACOS=0  &&  DEBIAN=0  &&  ARCHLINUX=0

[[ "$(uname)" = 'Darwin' ]]     && MACOS=1
[[ "$(uname -a)" =~ 'Debian' ]] && DEBIAN=1
[ -f '/etc/arch-release' ]      && ARCHLINUX=1

((MACOS))     && echo '> OSX Detected'
((DEBIAN))    && echo '> DEBIAN Detected'
((ARCHLINUX)) && echo '> ARCHLINUX Detected'

# Helper functions
# ------------------------------------------------------------

# Check if program is installed
function installed() {
    local _program="$1"
    local _result="$(which $_program)"
    echo $_result
    if [[ $_result == "$_program not found" ]]; then
	echo "$_program NOT INSTALLED"
        return true
    else
	if [[ -x $_result ]]; then
	    echo "$_program INSTALLED"
	    return true
	else
	    echo "$_program NOT INSTALLED"
	    return false
	fi
    fi
}

# Install package managers
# ------------------------------------------------------------
echo '> Installing package managers'

if ((MACOS)); then
    if ! installed "pip"; then
        echo '> Installing Python/pip'
        brew install python
        brew install python3
    fi

    if ! installed "yarn"; then
        echo '> Installing Yarn'
	    brew install yarn
    fi
fi

if [[ -d $HOME/.rvm ]]; then
    echo '> Installing RVM'
    gpg --keyserver hkp://keys.gnupg.net \
	--recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    curl -sSL https://get.rvm.io | bash -s stable --ruby
fi

# Install Neovim (OSX)
# ------------------------------------------------------------
if ((MACOS)); then
    echo '> Updating homebrew'
    brew update
    brew upgrade
    if ! installed "nvim"; then
        echo '> Installing NeoVim'
        brew install --HEAD neovim
    fi
fi

# Install Neovim (Debian)
# ------------------------------------------------------------
if ((DEBIAN)); then
  echo '> Installing NeoVim (Debian)'	
  sudo apt-get update
  sudo apt-get install \
    libtool libtool-bin autoconf automake cmake \
    libncurses5-dev g++ pkg-config unzip 
    software-properties-common \ 
    python-pip python3-pip

  # Download source
  mkdir -p $TMP_DIR
  rm -r $TMP_DIR/neovim
  git clone https://github.com/neovim/neovim $TMP_DIR/neovim
  cd $TMP_DIR/neovim
  git pull origin
  rm -r build/

  # Build and install neovim
  make CMAKE_BUILD_TYPE=RelWithDebInfo
  make install
fi

# Install Neovim (ArchLinux)
# ------------------------------------------------------------
if ((ARCHLINUX)); then
  echo '> Installing NeoVim (ArchLinux)'
  sudo yaourt neovim-git
  sudo pacman -S python2-neovim python-neovim
fi

# Install Node.js (OSX)
# ------------------------------------------------------------
if ((MACOS)); then
    if ! installed "node"; then
        echo '> Installing node.js'
        brew install node
        brew link node
        sudo npm install -g npm@latest
    fi 
fi

# Install SpaceVim
# ------------------------------------------------------------
if [[ ! -d "$HOME/.SpaceVim" ]]; then
    echo "> Installing SpaceVim"
    curl -sLf https://spacevim.org/install.sh | bash
fi

# Install NeoVim support libs
# ------------------------------------------------------------
echo '> Installing NeoVim Python packages'
pip2 install neovim --upgrade
pip3 install neovim --upgrade

echo '> Installing NeoVim Ruby gem'
sudo gem install neovim

# Install lint dependencies
# ------------------------------------------------------------
sudo gem install rubocop

pip install vim-vint \
	    yamllint \
	    flake8 \
	    proselint

sudo npm install -g eslint \
                    jsonlint \
                    sass-lint \
                    stylelint \
                    diff-so-fancy

yarn global add tslint \
		typescript

if ((DEBIAN)); then
    sudo apt install tidy
    sudo apt-get install shellcheck 
fi

if ((MACOS)); then
    brew install shellcheck
    brew install tidy-html5
fi

# Spelling word list
# ------------------------------------------------------------

cd ~/tmp
wget https://github.com/helmuthdu/vim/blob/master/spell/en.utf-8.spl
mkdir -p $HOME/.SpaceVim/spell
cp en.utf-8.spl $HOME/.SpaceVim/spell

echo '> DONE'
echo '> ----'
