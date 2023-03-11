#################################
#        Plugin Managment       #
#################################

# Clone zplug if needed
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zplug/init.zsh ]]; then
  command git clone https://github.com/zplug/zplug.git ${ZDOTDIR:-${HOME}}/.zplug
fi

# Load zplug once cloned
source ${ZDOTDIR:-${HOME}}/.zplug/init.zsh

#list of plugins
zplug "zsh-users/zsh-autosuggestions"               #Command suggestions
zplug "Tarrasch/zsh-bd"                             #Move to a parent dir in a fuzzy way
zplug "zsh-users/zsh-syntax-highlighting"           #Highlighting for commands
zplug "zsh-users/zsh-completions"                   #More completions for zsh
zplug "zsh-users/zsh-history-substring-search"      #Search prev commands via substr
zplug "ChrisPenner/copy-pasta"                      #Allows copy and paste of files
zplug "mdumitru/fancy-ctrl-z"                       #Enable ctrl z to go back into vim
zplug "b4b4r07/enhancd", use:init.sh                #better cd
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
      echo; zplug install
  fi
fi

# Then, source plugins and add commands to $PATH
zplug load 
ENHANCD_FILTER=fzy:fzf:peco
export ENHANCD_FILTER


#################################
#       History Settings        #
#################################

HISTFILE=~/.zplug/.histfile
HISTSIZE=10000
SAVEHIST=10000

setopt inc_append_history
setopt extended_history

#################################
#            Alias              #
#################################

alias ls='exa'
alias lsa='exa -a'
alias lS='exa -1'
alias lT='exa --tree'
alias lt='exa --tree --level=2'

# Redirect vi/vim to nvim 
alias vi="nvim"
alias vim="nvim"

# Color grep output
alias grep='grep --color=auto'

# I shouldnt need to specify each dir
alias mkdir='mkdir -pv'

alias c='clear'

# Protect myself from myself
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# List all mounted devices and thier mount locations in a readable way
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | grep -E --color=auto ^/dev/ | sort"

#################################
#      Package Managment        #
#################################

alias search='yay -Ss'
alias install='yay -S'
alias update='yay -Syu --devel'
alias uninstall='yay -Rs'
alias clean='yay -Yc'

alias gendb='yay -Y --gendb'

alias bckMirrors='sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup'
alias upMirrors='sudo systemctl start reflector.service &'

#################################
#         Misc Settings         #
#################################

export Editor="nvim"
unsetopt autocd
unsetopt beep

typeset -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ad8ee6" 
typeset -g ZSH_AUTOSUGGEST_STRATEGY=(completion)

PROMPT='%F{blue}%2~ %F{green}> '
RPROMPT="%F{#acb0d0}%t"
