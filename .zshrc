# Set this otherwise autocomplete wont work
setopt interactivecomments

PATH=~/.python/own/bin::~/.local/bin:$PATH
STEAMAPPS=~/.local/share/Steam/steamapps

eval "$(oh-my-posh init zsh --config ~/.ohmyposh.conf.json)"

# Keybindings for text traversal
#########################################################
bindkey  "^[[H"     beginning-of-line          #Home
bindkey  "^[[F"     end-of-line                #End
bindkey  "^[[3~"    delete-char                #Delete
bindkey  "^H"       backward-delete-word       #Ctrl+Delete
bindkey  "^[[3;5~"  delete-word                #Ctrl+Backspace
bindkey  "^[[1;5C"  forward-word               #Ctrl+RArrow
bindkey  "^[[1;5D"  backward-word              #Ctrl+LArrow
bindkey  "^i"       expand-or-complete-prefix

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
#     eza -1a --group-directories-first || /usr/bin/ls --almost-all --color --format=single-column --group-directories-first
# }

# Plugins
#########################################################
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Plugin added keybinds
#########################################################
bindkey  "^I"    menu-complete
bindkey  "^[[Z"  menu-select
bindkey  "^[[A"  history-substring-search-up
bindkey  "^[[B"  history-substring-search-down

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
