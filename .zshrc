# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
 alias zshconfig="nano ~/.zshrc"
 alias ohmyzsh="vim ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git fs-bookmark)

alias minecraft="java -Xmx1024M -Xms512M -cp ~/minecraft.jar net.minecraft.LauncherFrame"
alias gdel="git status | grep deleted | sed 's/^.*:\W*//g'"

source $ZSH/oh-my-zsh.sh


# Customize to your needs...
export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/usr/local/play-2.1.3

# Set rvm to a function
source ~/.rvm/scripts/rvm

function _d_reload_funcs(){
	for f in ~/.functions/*.sh; do source $f; done
}
_d_reload_funcs

export GOROOT="$HOME/go"
export PATH="$PATH:$GOROOT/bin"
export GOBIN=""
export GOARCH="386"
export GOCHAR="8"
export GOOS="linux"
export GOEXE=""
export GOHOSTARCH="386"
export GOHOSTOS="linux"
export GOTOOLDIR="/usr/lib/go/pkg/tool/linux_386"
export GOGCCFLAGS="-g -O2 -fPIC -m32 -pthread"
export CGO_ENABLED="1"
export GOPATH="$HOME/Repos/go"
