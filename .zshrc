#                 __
#     ____  _____/ /_  __________
#    /_  / / ___/ __ \/ ___/ ___/
#   _ / /_(__  ) / / / /  / /__
#  (_)___/____/_/ /_/_/   \___/
#
# nitch
xrdb -merge -I $HOME ~/.Xresources > /dev/null
autoload -U colors && colors
autoload -Uz +X compinit && compinit
autoload -Uz +X bashcompinit && bashcompinit
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
export EDITOR="nvim"
# export XDG_CURRENT_DESKTOP="sway"
export XDG_CURRENT_DESKTOP="hyprland"

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch
unsetopt beep
bindkey -v

alias fcd='cd $(ls -a | fzf)'
alias vv='nvim $(fzf)'
alias vim='nvim'
alias v='nvim'
alias hx='helix'
alias cp="rsync -avz"
alias size="du -h --max-depth=1"
alias hotspot="nmcli device wifi connect AndroidAP"
alias wifi="nmcli device wifi connect"

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'

alias tt='tt -theme pro'
alias snd='kdeconnect-cli -n RMX2001 --share $(fzf -m)'
alias con='kdeconnect-cli -l'
alias sda1='sudo mount /dev/sda1 /media/'
alias x='exit'
alias n='nnn'
alias ls='eza'
alias ll='eza -l'
alias lla='eza -la'
alias cat='bat'
alias tree='eza --tree'
alias add='sudo pacman -S'
alias remove='sudo pacman --remove --recursive'
alias update='sudo pacman -Syu'
alias hc='herbstclient'
alias mp3='yt-dlp --extract-audio --audio-format mp3 --audio-quality 0  '
alias mp4='yt-dlp '
alias img='swayimg'
alias zathura='zathura $(fzf)'
alias weather='curl wttr.in/680308'

eval $(thefuck --alias)

# nnn setup
BLK="0B" CHR="0B" DIR="04" EXE="06" REG="00" HARDLINK="06" SYMLINK="06" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
# alias n='NNN_FIFO=/home/daison/.config/nnn/nnn.fifo nnn -e'
export NNN_PLUG='v:imgview;p:preview-tui;k:kdeconnect;f:fixname;g:fzcd'
if [ -f /usr/share/nnn/quitcd/quitcd.bash_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_zsh
fi

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

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

export MOZ_ENABLE_WAYLAND=1
export QT_STYLE_OVERIDE=GTK+

# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.zsh
export PATH="/home/daison/bin:$PATH"
