# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

#export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.emacsbin:$PATH"
#export TMPDIR=~/tmp
#export LC_ALL=en_US.UTF-8

# Path to your oh-my-zsh installation.
export ZSH="/home/beren/.oh-my-zsh"
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="spaceship"
eval "$(starship init zsh)"

# FZT-TAB CONFIGURATION 
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
zstyle ':fzf-tab:complete:cd:*' popup-pad 30 0

# THEME CONFIGURATION

# Time
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_12HR=true

# Directory
SPACESHIP_DIR_TRUNC=2
SPACESHIP_DIR_TRUNC_PREFIX=../

# Command Line
SPACESHIP_VI_MODE_SHOW=false

# Exit Code
SPACESHIP_EXIT_CODE_SHOW=true

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-completions
  fzf-tab
)
 autoload -U compinit && compinit

source /usr/share/nvm/init-nvm.sh
# Zplug Plugins
FZ_HISTORY_CD_CMD="_zlua"

source ~/.zplug/init.zsh
source ~/.zplug/repos/momo-lab/zsh-abbrev-alias/abbrev-alias.plugin.zsh
source ~/.oh-my-zsh/custom/plugins/fzf-tab/fzf-tab.plugin.zsh

eval "$(lua ~/.zplug/repos/z.lua/z.lua --init zsh enhanced)"
zplug "momo-lab/zsh-abbrev-alias"
eval "$(thefuck --alias)"
source $ZSH/oh-my-zsh.sh

# User configuration

# Enable fzf-tab on default & Create default tmux session
if [[ -n "$TMUX" ]]; then
   enable-fzf-tab
 #elif [[ -z "$TMUX" ]]; then
     #tmux -u new -As default
fi 

# Zplug
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
#export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

# Aliases
alias ag="alias | grep "
alias cp="cp -ivg"
#alias dck="sudo docker "
#alias dcmp="sudo docker-compose "
alias docker="sudo docker "
alias docker-compose="sudo docker-compose "
alias mv="mv -ivg"
alias eft="enable-fzf-tab"
alias tft="toggle-fzf-tab"
alias ls="exa -lhFbTL1 --icons"
alias lsg="exa -lhFbG --icons"
alias gcm="git commit -m"
alias cl="clear"
alias gpo="git pull origin"
alias ni="npm install"
alias nu="npm uninstall"
alias nr="npm run"
alias psg="ps aux | grep"
alias py="python3"
alias piv="pipenv run nvim"
alias k9="killall -9"
alias lg="lazygit"
alias t="tmux -u" # Create tmux session and use UTF-8 output.
alias tnas="tmux -u new -As" # Create tmux session with a name or attach to an existing session.
alias ta="tmux -u a"
alias tat="tmux -u a -t"
alias tls="tmux ls"
alias tkt="tmux kill-session -t"
alias tks="tmux kill-server"
alias tsk="task"
alias tw="taskwarrior-tui"
alias unlock='sudo rm /var/lib/pacman/db.lck'
alias r="ranger"
alias v="nvim"
alias vw="nvim -c VimwikiIndex"
alias rmswap="rm -rf ~/.local/share/nvim/swap"
alias zat="zathura"
alias zh='z -I -t .'

# Abbreviation
abbrev-alias -g sps="sudo pacman -S"
abbrev-alias -g tskp="task project:P"

# Auto-expand aliases (Not working alongside with Vi-mod)
#function expand-alias() {
	#zle _expand_alias
	#zle self-insert
#}
#zle -N expand-alias
#bindkey -M main ' ' expand-alias

# Integrate Vi-Mode
bindkey -v

# Slow the performance of escaping for the bindkey 'jk' to work
export KEYTIMEOUT=10
bindkey -M viins 'jk' vi-cmd-mode

# Keymap default Emacs-style in Vi-mode
bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^E' end-of-line
bindkey -M viins '^W' backward-kill-word

# Using vim keys to navigate through completion menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Visual-Mode Hack. Using vim to edit command line
bindkey -M vicmd "^V" edit-command-line
bindkey -v '^?' backward-delete-char

# Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# Beginning incremental search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
bindkey "^P" up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# Updates editor information  and cursor when the keymap changes.
function zle-keymap-select {
  zle reset-prompt
  zle -R
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

#function vi_mode_prompt_info() {
  #echo "${${KEYMAP/vicmd/[% NORMAL]%}/(main|viins)/[% INSERT]%}"
#}

 #Define right prompt, regardless of whether the theme defined it
#RPS1='$(vi_mode_prompt_info)'
#RPS2=$RPS1

# Auto ls every cd
function chpwd(){
   emulate -L zsh
   ls
}

zplug load

