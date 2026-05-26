# ~/.zshrc

# XDG
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CACHE_HOME="${HOME}/.cache"

autoload -Uz compinit vcs_info select-word-style

# Cache completions, rebuild at most once per day
() {
  local zcd="${XDG_CACHE_HOME}/zsh/zcompdump-${ZSH_VERSION}"
  mkdir -p "${zcd:h}"
  if [[ -n ${zcd}(#qN.mh+24) ]]; then
    compinit -d "$zcd"
  else
    compinit -C -d "$zcd"
  fi
}

select-word-style bash

# History
HISTFILE=~/.zsh_history
HISTSIZE=500000
SAVEHIST=500000
setopt SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE

# Key bindings
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# Prompt
precmd() { vcs_info }
setopt PROMPT_SUBST
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '(%b)'
PROMPT='%F{green}%n@%m%f %F{135}%2~%f${vcs_info_msg_0_:+ %F{green}${vcs_info_msg_0_}%f$ '

# Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# PATH and tools
export PATH="${HOME}/.local/bin:${PATH}"
export TMUX_CONFIG="${XDG_CONFIG_HOME}/tmux/tmux.conf"
export TIG_CONFIG="${XDG_CONFIG_HOME}/tig/config"
export TIG_EDITOR=/usr/bin/nvim
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Aliases
alias gpg-tui="gpg-tui -s colored"
alias tn="tmux -u -f ${TMUX_CONFIG} new"
alias ta="tmux -u -f ${TMUX_CONFIG} attach"
alias tls="tmux -u -f ${TMUX_CONFIG} ls"
alias cat="bat --decorations never --plain --theme='gruvbox-dark'"
alias less="less -R"
alias pubkey_rsa="xclip -selection clipboard < ~/.ssh/id_rsa.pub && echo '=> Public key copied!'"
alias pubkey_ed25519="xclip -selection clipboard < ~/.ssh/id_ed25519.pub && echo '=> Public key copied!'"

# Tool completions and hooks
command -v uv     &>/dev/null && eval "$(uv generate-shell-completion zsh)"
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"
command -v fzf    &>/dev/null && eval "$(fzf --zsh)"
command -v direnv &>/dev/null && eval "$(direnv hook zsh)"

# Rust
[[ -f "${HOME}/.cargo/env" ]] && source "${HOME}/.cargo/env"

# uv
[[ -f "${HOME}/.local/bin/env" ]] && source "${HOME}/.local/bin/env"

# Go
export GOPATH="${HOME}/go"
export GOBIN="${GOPATH}/bin"
export PATH="${GOBIN}:${PATH}"
