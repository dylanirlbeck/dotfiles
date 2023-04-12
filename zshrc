# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
#export ZSH="/Users/dylanirlbeck/.oh-my-zsh"
export GPG_TTY=$(tty)
export PATH="$HOME/bin:$PATH"

export EDITOR=nvim
export VISUAL=nvim
export ANDROID_SDK=/Users/dylanirlbeck/Library/Android/sdk
export PATH=/Users/dylanirlbeck/Library/Android/sdk/platform-tools:$PATH

# Zlib stuff
# export LDFLAGS="-L/usr/local/opt/zlib/lib"
# export CPPFLAGS="-I/usr/local/opt/zlib/include"
# export CPPFLAGS=-I/usr/local/opt/openssl/include
# export LDFLAGS=-L/usr/local/opt/openssl/lib npm install
# export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"

# Flutter
export PATH="$PATH:$HOME/bin/flutter/bin"

# https://stackoverflow.com/questions/52671926/rails-may-have-been-in-progress-in-another-thread-when-fork-was-called
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# By default, let's use git stat with the base branch of master.
# At some point, this should change to main.
#
export REVIEW_BASE=master

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="powerlevel10k/powerlevel10k"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git npm yarn zsh-autosuggestions)
#source $ZSH/oh-my-zsh.sh

# Custom cd
chpwd() exa 

export FZF_DEFAULT_COMMAND='rg --files --hidden'

autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

# Kitty functions
# function kt-native() {
#   export PROJECT_DIR=$1
#   kitty --session ~/dotfiles/config/kitty/reason_native.conf
# }

# function kt-bs() {
#   export PROJECT_DIR=$1
#   kitty --session ~/dotfiles/config/kitty/bucklescript.conf
# }

# function kt-js() {
#   export PROJECT_DIR=$1
#   kitty --session ~/dotfiles/config/kitty/javascript.conf
# }

# fbd - delete git branch (including remote branches); credit to peterpme
fbd() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" | fzf --multi ) &&
  git branch -D $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}


# fco - checkout local git branch (inspired by peterpme's fbd above)
fco() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" | fzf --multi ) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

get_alias() {
  printf '%s\n' $aliases[$1]
}

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
DEFAULT_USER="dylan"
USER_PROFILE_PATH="$(echo ~/.zshrc)" 
source $HOME/.alias

#eval "$(fnm env)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# opam configuration
test -r /Users/dylanirlbeck/.opam/opam-init/init.zsh && . /Users/dylanirlbeck/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# Ruby stuff
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"
#eval "$(rbenv init -)"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
#source ~/powerlevel10k/powerlevel10k.zsh-theme
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
(( ! ${+functions[p10k]} )) || p10k finalize


# Extend zsh history to multiple sessions
setopt APPEND_HISTORY

typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

export GITHUB_USERNAME=dylan

export PATH="/usr/local/sbin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

eval "$(fnm env)"

set -o vi

export BUILDKITE_API_TOKEN='addf46359d16dca8f005df5b7c9e1a53d942efab'
export SNOWFLAKE_WAREHOUSE_XS="DBT_DEV_XS"
export SNOWFLAKE_WAREHOUSE_S="DBT_DEV_S"
export SNOWFLAKE_WAREHOUSE_M="DBT_DEV_M"
export SNOWFLAKE_WAREHOUSE_L="DBT_DEV_L"
export SNOWFLAKE_USERNAME="dylan@flexport.com"
export DBT_PROFILES_DIR="/Users/dylan/kimono/transform/dbt_transforms"

# Created by `pipx` on 2021-10-28 15:43:44
export PATH="$PATH:/Users/dylan/.local/bin"
export KMO_HOME="/Users/dylan/kimono"
export SNOWFLAKE_USERNAME="dylan@flexport.com"
alias k='kubectl'
