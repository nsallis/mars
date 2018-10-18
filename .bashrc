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
export PATH="$PATH:/usr/local/go/bin"
export GOPATH="$HOME/Documents/go"

alias vim="nvim"
alias customers="cd ~/work/ResponsiveCustomerPortalSC"
alias atoms="cd ~/work/ResponsiveCustomerPortalSC/src/components/ui/atoms"
export XDG_CURRENT_DESKTOP=GNOME
export EDITOR="nvim"

# use xmodmap to use homerow as arrow keys
xmodmap ~/.xmodmap

# powerbar install:

function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
