# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=1000000
setopt appendhistory autocd
bindkey -v
# End of lines configured by zsh-newuser-install

bindkey -v
bindkey "^R" history-incremental-search-backward

export EDITOR=vim

alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias less="vimpager"

alias preprod="ssh root@94.23.17.135"
alias mainserv="ssh root@ns3269944.ovh.net"
alias bigdata="ssh devcitae@192.168.96.56"

alias eggshot="cd /c/Documents\ and\ Settings/Barbie/Documents/eggshot"

alias czsh="vim ~/.zshrc"
alias cvim="vim ~/.vimrc"
alias ci3="vim ~/.i3/config"
alias cxd="vim ~/.Xdefaults"
alias cxinit="vim ~/.xinitrc"

alias reload="source ~/.zshrc"

alias pacin="sudo pacman -S"
alias pacupg="sudo pacman -Syu"

alias tarx="tar -zxvf"
alias tarc="tar -zcvf"

alias gr="grep -nr"
alias ta="tmux attach -t"

alias gs="git status"
alias ga="git add"
alias gau="git add -u"
alias gc="git commit -m"
alias gl="git log"
alias gd="git diff"
alias gpo="git push origin"

autoload -U colors && colors
PS1="%{$fg_bold[red]%}%n%{$reset_color%}@%{$fg_bold[blue]%}%m %{$fg_bold[yellow]%}%~ %{$reset_color%}%% "

# Add private keys to ssh-agent when first trying to ssh something
#ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'
