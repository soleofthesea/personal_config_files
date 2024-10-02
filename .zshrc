EDITOR=emacs

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Sort items 1 2 3 10, not 1 10 2 3
setopt NUMERIC_GLOB_SORT

# Dont write duplicate entries to history file
setopt HIST_IGNORE_ALL_DUPS

# Write all commands to history immediately rather than when terminal is closed
setopt INC_APPEND_HISTORY

# Make it so 'cd Documents' will always cd to ~/Documents, etc.
setopt CDABLE_VARS

Desktop=~/Desktop
Documents=~/Documents
Downloads=~/Downloads
Music=~/Music
Pictures=~/Pictures
Videos=~/Videos

PATH=~/.python/own/bin::~/.local/bin:$PATH
STEAMAPPS=~/.local/share/Steam/steamapps

eval "$(oh-my-posh init zsh --config ~/.ohmyposh.conf.json)"

# Keybindings for text traversal
#########################################################

bindkey  "^[[H"     beginning-of-line          #Home
bindkey  "^[[1~"    beginning-of-line          #Also Home, different TTY
bindkey  "^[[F"     end-of-line                #End
bindkey  "^[[4~"    end-of-line                #Also End, different TTY
bindkey  "^[[3~"    delete-char                #Delete
bindkey  "^H"       backward-delete-word       #Ctrl+Delete
bindkey  "^[[3;5~"  delete-word                #Ctrl+Backspace
bindkey  "^[[1;5C"  forward-word               #Ctrl+Right
bindkey  "^[[1;5D"  backward-word              #Ctrl+Left

# Alias UNIX commands w modern replacements, fallback if not exists
#########################################################
fn ls() {
  eza "$@" || /usr/bin/ls "$@"
}

fn ps() {
  procs "$@" || /usr/bin/ps "$@"
}

fn cat() {
  bat "$@" || /usr/bin/cat "$@"
}

# Function to list files & folders upon changing directory
#########################################################
# fn chpwd() {
#     emulate -L zsh
#     eza -aD || /usr/bin/ls -d --almost-all --color */
# }

# Plugins
#########################################################
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Plugin added keybinds
#########################################################
bindkey  "^I"    menu-complete                 #Tab
bindkey  "^[[Z"  menu-select                   #Shift-Tab
bindkey  "^[[A"  history-substring-search-up   #Up
bindkey  "^[[B"  history-substring-search-down #Down

(( ! ${+ZSH_AUTOSUGGEST_CLEAR_WIDGETS} )) && {
	typeset -ga ZSH_AUTOSUGGEST_CLEAR_WIDGETS
	ZSH_AUTOSUGGEST_CLEAR_WIDGETS=(
		history-search-forward
		history-search-backward
		history-beginning-search-forward
		history-beginning-search-backward
		history-substring-search-up
		history-substring-search-down
		up-line-or-beginning-search
		down-line-or-beginning-search
		up-line-or-history
		down-line-or-history
		menu-complete
		menu-select
		accept-line
		copy-earlier-word
	)
}

# Set this otherwise autocomplete wont work
setopt interactivecomments

# More colours
#########################################################
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern regexp line)
ZSH_HIGHLIGHT_STYLES[path]=fg=magenta,underline
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=cyan
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=cyan

zstyle ':completion:*' auto-description '%d'
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' format '%d'
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu yes select
zstyle ':completion:*' original true
zstyle :compinstall filename '~/.zshrc'

# Dont enable these, these are overriden by zsh-autocomplete
# autoload -Uz compinit
# compinit

# Stop Wine creating file associations
WINEDLLOVERRIDES=winemenubuilder.exe=d
