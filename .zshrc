# If you come from bash you might have to change your $PATH.
 export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/loesch/.oh-my-zsh

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt beep extendedglob nomatch
unsetopt appendhistory autocd notify
bindkey -e # emacs
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/loesch/.zshrc'

# Command completion
autoload -Uz compinit
compinit
# End of lines added by compinstall
zstyle ':completion:*' menu select # arrow keys for completion

# History search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search

# Themes
autoload -Uz promptinit
promptinit

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="robertloesch"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
plugins+=(k)
plugins+=(wd)

source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# GIT dotfiles ALIAS
alias config='/usr/bin/git --git-dir=/home/loesch/.dotfiles/ --work-tree=/home/loesch'
alias muxify='/home/loesch/Developer/muxify/muxify2.py'
alias urdf-viewer='/home/loesch/Developer/scripts/urdf-viewer.sh'
alias spawn-urdf='/home/loesch/Developer/scripts/spawn-urdf.sh'
alias myip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"

#########
## ROS ##
#########
source /opt/ros/kinetic/setup.zsh
export CURRENT_CMAKE_DEVEL_DIR="$(catkin locate --workspace ~/Developer/ROS/WS/julius_ws --devel)"
export CURRENT_CMAKE_BUILD_DIR="$(catkin locate --workspace ~/Developer/ROS/WS/julius_ws --build)"
source ${CURRENT_CMAKE_DEVEL_DIR}/setup.zsh
#export ROS_HOSTNAME=localhost

############
## ROS_IP ##
############
# automatically get IP
 export ROS_IP="$(ifconfig | grep -m1 'inet addr:192' | cut  -c 21- | cut -d " " -f1)"
#---------------------------
# export ROS_IP="192.168.1.211" # toshiba eth
# export ROS_IP="192.168.1.212" # toshiba wifi
# export ROS_IP="192.168.1.213" # lenovo eth0
# export ROS_IP="192.168.1.214" # lenovo wifi

####################
## ROS_MASTER_URI ##
####################
# export ROS_MASTER_URI=http://$ROS_IP:11311
# export ROS_MASTER_URI=http://192.168.1.211:11311 # toshiba eth
# export ROS_MASTER_URI=http://192.168.1.212:11311 # tishiba wifi
# export ROS_MASTER_URI=http://192.168.1.213:11311 # lenovo eth
# export ROS_MASTER_URI=http://192.168.1.214:11311 # lenovo wifi
 export ROS_MASTER_URI=http://192.168.1.10:11311  # julius main

export EDITOR='nano'


#########################
# QT Creator ROS plugin #
#########################
#source /opt/qt57/bin/qt57-env.sh

# GAZEBO
export LC_NUMERIC=C # Workaround wegen Fehlermeldung

# export GAZEBO_IP=192.168.1.211 # toshiba eth
# export GAZEBO_IP=192.168.1.212 # toshiba wifi
 export GAZEBO_IP=192.168.1.213 # lenovo eth0
# export GAZEBO_IP=192.168.1.214 # lenovo wifi
# export GAZEBO_IP=192.168.178.28

#export GAZEBO_MASTER_URI=http://192.168.1.10:11345 # julius
#export GAZEBO_MASTER_URI=http://192.168.1.199:11345 # pm
export GAZEBO_MASTER_URI=http://$GAZEBO_IP:11345 # own

# for urdf-viz
source ~/.cargo/env 
