if status is-interactive
    # Commands to run in interactive sessions can go here
end

/opt/homebrew/bin/brew shellenv | source

# Common
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_CACHE_HOME $HOME/.cache

# VSCode
fish_add_path /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/

# Exports
set -x TMUX_CONFIG $XDG_CONFIG_HOME/tmux/tmux.conf
set -x TIG_CONFIG $XDG_CONFIG_HOME/tig/config
set -x TIG_EDITOR /usr/local/bin/nvim
set -x ANSIBLE_CONFIG $XDG_CONFIG_HOME/ansible/ansible.cfg

# Rust
source $HOME/.cargo/env.fish

# Python
set -x PYTHONSTARTUP $XDG_CONFIG_HOME/pythonrc.py

# Pyenv 
set -x PYENV_ROOT $HOME/.pyenv
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Go
fish_add_path $(go env GOPATH)/bin
set -x GOPATH $(go env GOPATH)

# Aliases
alias local_ip='ifconfig |grep en0: -A 4 |grep \'inet \' |awk \'{print $2}\''
alias tn='tmux -u -f $TMUX_CONFIG new'
alias ta='tmux -u -f $TMUX_CONFIG attach'
alias tls='tmux -u -f $TMUX_CONFIG ls'
alias dc='docker-compose'
alias dcl='docker-compose logs'
alias dclt='docker-compose logs --tail'
