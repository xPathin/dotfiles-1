# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

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
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)


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

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Editor
export EDITOR=vim
alias vi='vim'

# Ranger alias
rg() {
    if [ -z "$RANGER_LEVEL" ]
    then
        ranger
    else
        exit
    fi
}

# Dictionary
function def { sdcv --data-dir ~/Documents/Script/EnglishDic/ -n "$1" | less}
function sig { sdcv --data-dir ~/Documents/Script/FrenchDic/ -n "$1" | less}

# TMUX
# If not running interactively, do not do anything
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux

# Latexmk
alias ltx="grep -l '\\documentclass' *tex | xargs latexmk -pdf -pvc -silent > /dev/null 2>&1 &"

# Cower upgrade packages
function cowerup() { cower -df "${1%%/}" ; cd ~/.builds/"${1%%/}" ; makepkg -si ; cd ~ ; }

# SSH alias
alias conssh=' ssh  -p 7777 cristian@127.0.0.1 -Y'
alias enscp='  ssh  -X c.perez-brokate@193.51.253.15 -p 993'
#alias enscp='  ssh  c.perez-broka@193.51.253.222 -Y'
alias leri8='  ssh  -p 993 c.perez-brokate@193.51.253.15 -L 7777:10.0.1.122:22'

function putssh() { scp -P 7777 -pr "${1%%/}" cristian@127.0.0.1:~/ ; }
function getssh() { scp -P 7777 -pr cristian@127.0.0.1:/home/cristian/"${1%%/}" ./ ; }

# Rsync backup
alias pc2toshiba='rsync -avzh --delete --progress         /home/arch/Documents/UPMC               /run/media/arch/Toshiba'
alias pc2toshibaCV='rsync -avzh --delete --progress       /home/arch/Documents/CVS/               /run/media/arch/Toshiba2/Clases/CVS/'
alias pc2toshibaMusic='rsync -avzh --delete --progress    /home/arch/Music                        /run/media/arch/Toshiba'
alias pc2toshibaPapeles='rsync -avzh --delete --progress  /home/arch/Documents/Papeles/           /run/media/arch/Toshiba2/Clases/Papeles/'
alias pc2toshibaPictures='rsync -avzh --delete --progress /home/arch/Images/                      /run/media/arch/Toshiba2/Pictures/'
alias pc2toshibaR='rsync -avzh --delete --progress        /home/arch/R/examples/                  /run/media/arch/Toshiba2/Clases/R/'
alias pc2toshibaScript='rsync -avzh --delete --progress   /home/arch/Documents/Script             /run/media/arch/Toshiba2/Clases'
alias pc2toshibaTotal='rsync -avzh --delete --progress    /home/arch/Documents/                   /run/media/arch/Toshiba2/Clases/'
alias toshiba2pc='rsync -avzh --delete --progress         /run/media/arch/Toshiba/UPMC            /home/arch/Documents'
alias toshiba2pcCV='rsync -avzh --delete --progress       /run/media/arch/Toshiba2/Clases/CVS/    /home/arch/Documents/CVS/'
alias toshiba2pcMusic='rsync -avzh --delete --progress    /run/media/arch/Toshiba/Music/          /home/arch/Musique/'
alias toshiba2pcPapeles='rsync -avzh --delete --progress  /run/media/arch/Toshiba2/Clases/Papeles /home/arch/Documents'
alias toshiba2pcPictures='rsync -avzh --delete --progress /run/media/arch/Toshiba2/Pictures/      /home/arch/Images/'
alias toshiba2pcR='rsync -avzh --delete --progress        /run/media/arch/Toshiba2/Clases/R/      /home/arch/R/examples/'
alias toshiba2pcScript='rsync -avzh --delete --progress   /run/media/arch/Toshiba2/Clases/Script/ /home/arch/Documents/Script/'
alias toshiba2pcTotal='rsync -avzh --delete --progress    /run/media/arch/Toshiba2/Clases/        /home/arch/Documents'
alias ddisk='udisksctl unmount -b /dev/sdc1;udisksctl unmount -b /dev/dm-0;udisksctl lock -b /dev/sdc2;udisksctl power-off -b /dev/sdc;'
alias ddiskup='udisksctl mount -b /dev/sdc1;udisksctl unlock -b /dev/sdc2;udisksctl mount -b /dev/dm-0;'

alias nm='nmtui-connect' # Network Manager
alias ledu='sudo ~/.config/i3/leds_up.sh' # keyboardlight
alias ledd='sudo ~/.config/i3/leds_down.sh' # keyboardlight
