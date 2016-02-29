# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/jbigalet/.zshrc'

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

alias preprod="ssh root@94.23.17.135"
alias mainserv="ssh root@ns3269944.ovh.net"

alias czsh="vim ~/.zshrc"
alias cvim="vim ~/.vimrc"
alias ci3="vim ~/.i3/config"
alias cxd="vim ~/.Xdefaults"
alias cxinit="vim ~/.xinit"

alias grips="nohup grip > /dev/null 2>&1 &"

alias reload="source ~/.zshrc"

alias pacin="sudo pacman -S"
alias pacupg="sudo pacman -Syu"

alias tarx="tar -zxvf"
alias tarc="tar -zcvf"

if [[ ${$(hostname)%%.*} == "ns204990" ]] then
  alias faqplus="cd /home/jbigalet/meteor/faqplus"
  alias nrj="cd /home/jbigalet/meteor/nrj"
  alias pickout='cd /home/laravel/pickout'
  alias comex='cd /home/laravel/comexplus'
  alias checkme='cd /home/laravel/checkme'
  alias ch='checkme'
  alias crysamap='cd /home/laravel/crysamap'
  alias csps='cd /home/laravel/csps'
  alias jocsps='cd /home/laravel/csps-jo'
  alias carto='cd /home/laravel/cartoplus'
  alias cci='cd /home/laravel/cci'

  export PATH=~/.composer/vendor/bin:$PATH
fi

autoload -U colors && colors
PS1="%{$fg_bold[red]%}%n%{$reset_color%}@%{$fg_bold[blue]%}%m %{$fg_bold[yellow]%}%~ %{$reset_color%}%% "

alias tat="tmux attach -t"
