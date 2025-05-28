# If you come from bash you might have to change your $PATH.
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/.atuin/bin:/home/bk/bin:$PATH"

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh


# Set to editing mode
set -o vi

# Exports
export KEYTIMEOUT=1
export EDITOR=nvim
export VISUAL=nvim
export BROWSER="brave"
export VIDEO="mpv"

# NNN file manager changes
export NNN_PLUG='o:fzopen;y:preview-tui'
export NNN_TRASH=1

## follow XDG base dir specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"


## moving other files and some other vars
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export WINEPREFIX="$XDG_DATA_HOME"/wine
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export XCURSOR_PATH=/usr/share/icons:$XDG_DATA_HOME/icons

export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages

export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
# For a full list of active aliases, run `alias`.
alias c='clear'
alias u='sudo pacman -Syu'
alias sp='sudo pacman'
alias i='sudo pacman -S'
alias un='sudo pacman -Rns'
alias y='yay -S'
alias v='nvim'
alias vs='nvim $(fzf --preview="bat --color=always {}")'
alias yz='yazi'
alias n='nnn'
alias la='ls -lathr'
alias f='fzf'
alias fp='fzf --preview="bat --color=always {}"' # find all files recursively and sorts by last modification, ignore hidden files
#alias lastmod='find . -type  f -not -path "*/\.*" -exec ls -lrt {} +'
alias rm='rmtrash'
alias rmdir='rmdirtrash'
alias sz='source ~/.zprofile'
alias st='tmux source ~/.config/tmux/tmux.conf'
alias cp='cp -i' 
alias mv='mv -i'


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

# Fix Ctrl+L (clear screen) in tmux
if [[ $TERM == screen* ]]; then
  bindkey '^L' clear-screen
fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi


# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


# Automatically start tmux if not already inside a tmux session
if command -v tmux >/dev/null 2>&1; then # Auto-start tmux if not already inside one
  if [ -z "$TMUX" ] && [ -n "$PS1" ]; then # Only start tmux for interactive shells and if not already in a tmux session
    tmux new-session -s "session$(tmux list-sessions 2>/dev/null | wc -l | awk '{print $1 + 1}')" # Create a new tmux session with a new number 
    exit  # prevent duplicate shell inside the new tmux session
  fi
fi


# Shell Intergrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(atuin init zsh)"
