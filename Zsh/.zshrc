### Plugin Managment
  # Clone Zcomet if needed
  if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
    command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
  fi

  # Load Zcomet once cloned
  source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh
  
  #list of plugins
  zcomet load zsh-users/zsh-autosuggestions               #Command suggestions
  zcomet load wting/autojump                              #Smart cd replacement based on prev dir's
  zcomet load Tarrasch/zsh-bd                             #Move to a parent dir in a fuzzy way
  zcomet load zpm-zsh/clipboard                           #Allows direct access to clipboard through pipe
  zcomet load zsh-users/zsh-syntax-highlighting           #Highlighting for commands
  zcomet load zsh-users/zsh-completions                   #More completions for zsh
  zcomet load zsh-users/zsh-history-substring-search      #Search prev commands via substr
  zcomet load ChrisPenner/copy-pasta                      #Allows copy and paste of files
  zcomet load mdumitru/fancy-ctrl-z                       #Enable ctrl z to go back into vim

  # Run compinit and compile cache
  zcomet compinit
### History
  HISTFILE=~/.histfile
  HISTSIZE=10000
  SAVEHIST=10000
  
  # Write to history immediately and save timestamp
  setopt inc_append_history
  setopt extended_history

##Alias'
  #ls related alias
  alias ls='exa'
  alias lsa='ls -a'
  alias lS='ls -1'
  alias lT='ls --tree'
  alias lt='lT --level=2'

  #redirect vi/vim to nvim 
  alias vi="nvim"
  alias vim="nvim"

  #color grep output
  alias grep='grep --color=auto'

  #some nice cd tricks
  alias ~='cd ~/'
  alias ..='cd ..; ls'

  #I shouldnt need to specify each dir
  alias mkdir='mkdir -pv'

  #I prefer to type clear over ctrl + l
  alias c='clear'
  
  #protect myself from myself
  alias chown='chown --preserve-root'
  alias chmod='chmod --preserve-root'
  alias chgrp='chgrp --preserve-root'
 
  #list all mounted devices and thier mount locations in a readable way
  alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"

  alias bckMirrors='sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup'
  alias upMirrors='sudo reflector --latest 200 --protocol http,https --sort rate --save /etc/pacman.d/mirrorlist'

### Misc
  #set out editor to nvim incase we need it
  export Editor="nvim"

  #ensure auto cd is off
  unsetopt autocd
  #ensure error beeping is off
  unsetopt beep
typeset -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ad8ee6" 
typeset -g ZSH_AUTOSUGGEST_STRATEGY=(completion)

PROMPT='%F{blue}%2~ %F{green}> '
RPROMPT="%F{#acb0d0}%t"
