# Add user configurations here
# For HyDE to not touch your beloved configurations,
# we added a config file for you to customize HyDE before loading zshrc
# Edit $ZDOTDIR/.user.zsh to customize HyDE before loading zshrc

#  Plugins 
# oh-my-zsh plugins are loaded  in $ZDOTDIR/.user.zsh file, see the file for more information

# If you come from bash you might have to change your $PATH.
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/.atuin/bin:/home/bk/bin:$PATH"

#ZSH_THEME="kphoen"
ZSH_THEME="gnzh"

# Source files
[[ -f "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"
[[ -f "$HOME/.zsh_private" ]] && source "$HOME/.zsh_private"
[[ -f "$HOME/.config/zsh/shell_changes/.shell_alias" ]] && source "$HOME/.config/zsh/shell_changes/.shell_alias"
[[ -f "$HOME/.config/zsh/shell_changes/.shell_exports" ]] && source "$HOME/.config/zsh/shell_changes/.shell_exports"
[[ -f "$HOME/.config/zsh/shell_changes/.shell_changes" ]] && source "$HOME/.config/zsh/shell_changes/.shell_changes"
# fzf keybindings & completion (if installed via pacman)
[[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
[[ -f /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh

# Set to editing mode
set -o vi

# fzf options
zstyle  ':completion:*' menu no
zstyle  ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath' 
zstyle  'fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# ------History----- 
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt HIST_IGNORE_SPACE # Don't save when prefixed with HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS # Don't save duplicate lines
setopt HIST_SAVE_NO_DUPS # Don't save any duplicate
setopt HIST_FIND_NO_DUPS # To show no dups when looking though history
setopt APPEND_HISTORY # to append command to the hisory file 
setopt SHARE_HISTORY # Share history between sessions
setopt AUTOCD # type a dir to cd

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git archlinux vi-mode )

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="disable"
# Shell Intergrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(atuin init zsh)"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519


# Generated for envman. Do not edit.1
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
export PATH=$PATH:$HOME/go/bin

