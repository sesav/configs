# ~/.zshrc

autoload -Uz compinit vcs_info select-word-style
compinit
select-word-style bash

HISTFILE=~/.zsh_history
HISTSIZE=500000
SAVEHIST=500000

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

precmd() { vcs_info }
setopt PROMPT_SUBST

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '(%b)'

PROMPT='%F{green}%n@%m%f %F{135}%2~%f${vcs_info_msg_0_:+ %F{green}${vcs_info_msg_0_}%f $ '

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="$HOME/.local/bin:$PATH"
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache
export TMUX_CONFIG=$XDG_CONFIG_HOME/tmux/tmux.conf
export TIG_CONFIG=$XDG_CONFIG_HOME/tig/config
export TIG_EDITOR=/usr/bin/nvim
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

alias gpg-tui="gpg-tui -s colored"
alias tn="tmux -u -f $TMUX_CONFIG new"
alias ta="tmux -u -f $TMUX_CONFIG attach"
alias tls="tmux -u -f $TMUX_CONFIG ls"
alias cat="bat --decorations never --plain --theme='gruvbox-dark'"
alias less="less -R"
alias pubkey_rsa="xclip -selection clipboard < ~/.ssh/id_rsa.pub && echo '=> Public key copied!'"
alias pubkey_ed25519="xclip -selection clipboard < ~/.ssh/id_ed25519.pub && echo '=> Public key copied!'"

command -v uv &> /dev/null && eval "$(uv generate-shell-completion zsh)"
command -v zoxide &> /dev/null && eval "$(zoxide init zsh)"
command -v fzf &> /dev/null && eval "$(fzf --zsh)"

eval "$(direnv hook zsh)"
