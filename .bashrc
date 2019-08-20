# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/bin/"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/.bin"
export PATH="$PATH:$HOME/Documents/go/bin"
export PATH="$PATH:$HOME/.bin/Sencha/Cmd/sencha"
export GOPATH="$HOME/Documents/go"

alias vim="nvim"
alias customers="cd ~/work/ResponsiveCustomerPortalSC"
alias atoms="cd ~/work/ResponsiveCustomerPortalSC/src/components/ui/atoms"
alias godir="cd ~/Documents/go/src/github.com/nsallis"
alias ls="exa -h"
export XDG_CURRENT_DESKTOP=GNOME
export EDITOR="nvim"
alias portainer="docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer"
alias python=python3

# export DOCKER_HOST=127.0.0.1 # <- should not be needed as long as port 3306 is not being used

# infinite history
HISTSIZE=
HISTFILESIZE=

# use xmodmap to use homerow as arrow keys
xmodmap ~/.xmodmap

# powerbar install:

function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
