HISTFILE=~/.histfile
HISTSIZE=100
SAVEHIST=100
setopt appendhistory

PATH=~/.local/bin:$PATH
STEAMAPPS=~/.local/share/Steam/steamapps

bindkey  "^[[H"     beginning-of-line      #Home
bindkey  "^[[F"     end-of-line            #End
bindkey  "^[[3~"    delete-char            #Delete
bindkey  "^H"       backward-delete-word   #Ctrl+Delete
bindkey  "^[[3;5~"  delete-word            #Ctrl+Backspace
bindkey  "^[[1;5C"  forward-word           #Ctrl+RArrow
bindkey  "^[[1;5D"  backward-word          #Ctrl+LArrow

eval "$(oh-my-posh init zsh --config ~/.ohmyposh.conf.json)"

source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
