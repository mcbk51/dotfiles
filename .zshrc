# If you come from bash you might have to change your $PATH.
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/.atuin/bin:/home/bk/bin:$PATH"

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

# Set to editing mode
set -o vi


# fzf keybindings & completion (if installed via pacman)
[[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
[[ -f /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh

zstyle  ':completion:*' menu no
zstyle  ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath' 
zstyle  'fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

#OH-MY-Posh
POSH_THEME="kali"
#"clean-detailed"
eval "$(oh-my-posh init zsh --config /home/bk/Documents/posh-themes/themes/$POSH_THEME.omp.json)"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git archlinux zsh-syntax-highlighting zsh-autosuggestions vi-mode zsh-completions fzf-tab zoxide command-not-found)


# ------History----- 
HISTFILE=~/.zsh_history
HISTSIZE=8000
SAVEHIST=$HISTSIZE

setopt HIST_IGNORE_SPACE # Don't save when prefixed with HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS # Don't save duplicate lines
setopt APPEND_HISTORY # to append command to the hisory file 
setopt SHARE_HISTORY # Share history between sessions

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Shell Intergrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(atuin init zsh)"
