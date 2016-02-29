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

alias ls="ls --color=auto"
alias preprod="ssh root@94.23.17.135"
alias mainserv="ssh root@ns3269944.ovh.net"

export EDITOR=vim

alias czsh="vim ~/.zshrc"
alias cvim="vim ~/.vimrc"
alias ci3="vim ~/.i3/config"
alias cxd="vim ~/.Xdefaults"
alias cxinit="vim ~/.xinit"

alias reload="source ~/.zshrc"

alias pacin="sudo pacman -S"
alias pacupg="sudo pacman -Syu"

alias tarx="tar -zxvf"
alias tarc="tar -zcvf"

alias tat="tmux attach -t"

autoload -U colors && colors
PS1="%{$fg_bold[red]%}%n%{$reset_color%}@%{$fg_bold[blue]%}%m %{$fg_bold[yellow]%}%~ %{$reset_color%}%% "


alias dev='cd /home/theodo/crysalide/projects/devtests'
alias inte='cd /home/theodo/crysalide/projects/devinte'
alias cro='cd /home/theodo/crysalide/projects/croixrougefrancaise'


function powerline_precmd() {
    PS1="$(/home/jbigalet/powerline-shell/powerline-shell.py $? --shell zsh 2> /dev/null)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

. ~/.local/bin/z/z.sh
