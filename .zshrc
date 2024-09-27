HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

PATH=~/.local/bin:$PATH
STEAMAPPS=~/.local/share/Steam/steamapps

eval "$(oh-my-posh init zsh --config ~/.ohmyposh.conf.json)"

zstyle :compinstall filename '/home/wasd/.zshrc'
autoload -Uz compinit
compinit

bindkey  "^[[H"     beginning-of-line      #Home
bindkey  "^[[F"     end-of-line            #End
bindkey  "^[[3~"    delete-char            #Delete
bindkey  "^H"       backward-delete-word   #Ctrl+Delete
bindkey  "^[[3;5~"  delete-word            #Ctrl+Backspace
bindkey  "^[[1;5C"  forward-word           #Ctrl+RArrow
bindkey  "^[[1;5D"  backward-word          #Ctrl+LArrow

alias fs="eza -la --group-directories-first"

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

bindkey  "^[[A"     history-substring-search-up
bindkey  "^[[B"     history-substring-search-down

#More colours
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern regexp line)

#Stop Wine creating file associations
WINEDLLOVERRIDES=winemenubuilder.exe=d
