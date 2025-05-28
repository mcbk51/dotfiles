[[ -o login ]] && source ~/.zshrc

# Exports
export KEYTIMEOUT=1
export EDITOR=nvim
export VISUAL=nvim
export BROWSER="brave"
export VIDEO="mpv"

# NNN file manager changes
export NNN_PLUG='o:fzopen;y:preview-tui'
export NNN_TRASH=1

# For a full list of active aliases, run `alias`.
alias c='clear'
alias syu='sudo pacman -Syu'
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
alias sz='source ~/.zshrc'
alias st='tmux source ~/.config/tmux/tmux.conf'
alias cp='cp -i' 
alias mv='mv -i'


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
