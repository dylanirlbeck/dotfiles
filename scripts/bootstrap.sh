#!/bin/zsh

###############################################################################
# setup-brew
#
# A shell script to automate system tool setup for Mac OS X.
###############################################################################


###############################################################################
# Install Xcode command line tools
###############################################################################
echo "Installing Xcode Command Line Tools..."
#xcode-select --install


###############################################################################
# Check for Homebrew, else install
###############################################################################
echo "Checking for, or Installing Homebrew..."
if [ -z `command -v brew` ]; then
    echo "Brew is missing! Installing it..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi;


##############################################################################
# Make sure we're on latest Homebrew
###############################################################################
echo "Homebrew: updating..."
brew update


###############################################################################
# Upgrade any already-installed formulae
###############################################################################
echo "Homebrew: upgrading..."
brew upgrade


###############################################################################
# Install utilities
###############################################################################
echo "Homebrew: updating unix tools..."
brew install zsh
brew install zsh-completions

# Change the default shell to zsh
zsh_path="$( command -v zsh )"
if ! grep "$zsh_path" /etc/shells; then
    echo "adding $zsh_path to /etc/shells"
    echo "$zsh_path" | sudo tee -a /etc/shells
fi

if [[ "$SHELL" != "$zsh_path" ]]; then
    chsh -s "$zsh_path"
    echo "default shell changed to $zsh_path"
fi

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

echo "Use the Powerlevel 10k prompt: https://github.com/romkatv/powerlevel10k#prezto"
while true; do
    read -p "Have you downloaded the Powerlevel 10k prompt?" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) continue;;
        * ) echo "Please answer yes or no.";;
    esac
done

#brew install homebrew/cask-fonts/font-fira-mono-for-powerline


###############################################################################
# Install binaries and other packages
###############################################################################
echo "Homebrew: installing binaries and other packages..."
brew install bat
brew install exa
brew install fzf
brew install git
brew install gh
brew install git-delta
#brew install hub
brew install httpie # https://httpie.org/
brew install kitty # https://formulae.brew.sh/cask/kitty
#brew install mackup
brew install mas # https://github.com/mas-cli/mas
brew install neovim
brew install nginx
brew install node
brew install ripgrep
brew install Schniz/tap/fnm # Fast Node Manager - https://github.com/Schniz/fnm
brew install rename # rename -x *- http://plasmasturm.org/code/rename/
brew install tree
brew install webkit2png # Screenshot web pages - https://github.com/paulhammond/webkit2png/
brew install yarn
brew install cloc
brew install opam
brew install sqlite
brew install scc # better cloc
brew install tree-sitter
brew install zsh-completions

brew tap homebrew/cask-fonts
brew install font-iosevka


###############################################################################
# Run Homebrew cleanup to remove installation/cached files
###############################################################################
echo "Homebrew: cleaning up..."
brew cleanup


###############################################################################
# Install Node Packages with NPM
###############################################################################
echo "Node: installing Yarn/NPM packages…"
yarn global add bs-platform

###############################################################################
# Install applications with Homebrew Cask
###############################################################################
echo "Homebrew Cask: installing apps..."
brew install 1password
brew install alfred
brew install dash
brew install docker
# brew cask install dropbox
#brew install figma
brew install firefox
# brew install github
brew install notion
brew install slack
brew install spotify
brew install visual-studio-code
brew cask install zoomus

###############################################################################
# Prompt user to install apps not available view brew
###############################################################################
echo "Go to https://justgetflux.com/dlmac.html to download f.lux"
while true; do
    read -p "Have you installed f.lux?" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) continue;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo "Go to https://www.cockos.com/licecap/licecap130.dmg to download LiceCAP"
while true; do
    read -p "Have you installed LiceCap?" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) continue;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo "Go to https://github.com/Hammerspoon/hammerspoon/releases/tag/0.9.78 to
download Hammerspoon"
while true; do
    read -p "Have you installed Hammerspoon?" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) continue;;
        * ) echo "Please answer yes or no.";;
    esac
done

###############################################################################
# Cleanup
###############################################################################
brew cleanup

echo "macOS Config, Dev Tools, Apps are Done Setup!"
