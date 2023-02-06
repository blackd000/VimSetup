# Created by keilar for 5.8.1

# Convert some stuffs
alias ls='ls --color=auto'
alias open='xdg-open'
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

alias gotoAdmin='cd /mnt/c/Users/Administrator'
alias codeCpp='cd /home/keilar/Programming/Cpp && ranger'
alias codeHtmlCss='cd /mnt/c/Users/Administrator/Documents/Programming/Html-Css && code .'
alias gotoSQL='cd /mnt/c/Users/Administrator/Documents/Programming/Sql'

# history setup
setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=300
HISTSIZE=299
setopt HIST_EXPIRE_DUPS_FIRST

# Enable colors and change prompt:
autoload -U colors && colors

autoload -Uz vcs_info # Load version control information
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b)' # Format the vcs_info_msg_0_ variable
setopt PROMPT_SUBST # Set up the prompt (with git branch name)

PROMPT='%B%{$fg[white]%}╭─%{$fg[yellow]%}%n@%M %{$fg[cyan]%}%~ %{$fg[magenta]%}${vcs_info_msg_0_}
%{$fg[white]%}╰─$%{$reset_color%}%b '

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

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

# Load zsh-syntax-highlighting; should be last.
source /home/keilar/Program/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
