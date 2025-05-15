# If you come from bash you might have to change your $PATH.
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/.atuin/bin:/home/bk/bin:$PATH"

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

# Set to editing mode
set -o vi
export EDITOR=nvim
export VISUAL=nvim
export BROWSER="brave"
export VIDEO="mpv"

# NNN file manager changes
export NNN_PLUG='o:fzopen;y:preview-tui'
export NNN_TRASH=1

# fzf keybindings & completion (if installed via pacman)
[[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
[[ -f /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh

zstyle  ':completion:*' menu no
zstyle  ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath' 
zstyle  'fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

#OH-MY-Posh
POSH_THEME="nordtron"
#"clean-detailed"
eval "$(oh-my-posh init zsh --config /home/bk/Documents/posh-themes/themes/$POSH_THEME.omp.json)"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git archlinux zsh-syntax-highlighting zsh-autosuggestions vi-mode zsh-completions fzf-tab zoxide command-not-found)

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

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

# For a full list of active aliases, run `alias`.
alias v='nvim'
alias c='clear'
alias s='nvim $(fzf --preview="bat --color=always {}")'
alias r='ranger'
alias n='nnn'
alias la='ls -lathr'
alias syu='sudo pacman -Syu'
alias sp='sudo pacman -S'
alias f='fzf'
alias fp='fzf --preview="bat --color=always {}"' # find all files recursively and sorts by last modification, ignore hidden files
#alias lastmod='find . -type  f -not -path "*/\.*" -exec ls -lrt {} +'
alias rm='rmtrash'
alias rmdir='rmdirtrash'

# Automatically start tmux if not already inside a tmux session
if command -v tmux >/dev/null 2>&1; then # Auto-start tmux if not already inside one
  if [ -z "$TMUX" ] && [ -n "$PS1" ]; then # Only start tmux for interactive shells and if not already in a tmux session
    tmux new-session -s "auto-$(date +%s)" # Create a new tmux session with a unique name (based on PID or timestamp)
    exit  # prevent duplicate shell inside the new tmux session
  fi
fi

# Fix Ctrl+L (clear screen) in tmux
if [[ $TERM == screen* ]]; then
  bindkey '^L' clear-screen
fi

# Shell Intergrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(atuin init zsh)"
