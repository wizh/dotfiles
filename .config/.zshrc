# Set Path
export PATH=$HOME/.bin:$PATH
export PATH=$HOME/.cargo/bin/:$PATH
export PATH=/usr/local/bin:$PATH

# Path to oh-my-zsh installation
export ZSH=/home/mathias/.oh-my-zsh

# Set theme to load
ZSH_THEME="gallois"

# Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Editor
export EDITOR='vim'

# Aliases
alias vim='nvim'
alias sudo='sudo '
alias shutdown='systemctl poweroff'
alias reboot='systemctl reboot'
alias lock='lock.sh'
alias sp='sp.sh'
alias pdf='zathura'
alias apvlv='zathura'

# Automatically startx
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  startx
fi

# Alow user defined functions
sudo-user() sudo zsh -c "$functions[$1]" "$@"

# C++ Compiling
alias g++='g++ -std=g++11'

# Power mechanisms
alias shutdown='systemctl poweroff'
alias reboot='systemctl reboot'

# Wi-Fi 
function wifi-scan(){
  iwlist wlan0 scan | grep -C 25 -i $1 | tail -n 31 
}
