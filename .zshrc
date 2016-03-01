##
## Executes commands at the start of an interactive session.
##
## Authors:
##   Sorin Ionescu <sorin.ionescu@gmail.com>
##
#
## Source Prezto.
#if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
#fi
#
## Customize to your needs...
#
#
#
#
## The following lines were added by compinstall

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

alias how="how2"

alias preprod="ssh root@94.23.17.135"
alias mainserv="ssh root@ns3269944.ovh.net"
alias bigdata="ssh devcitae@192.168.96.56"
alias cspsprod="ssh jbigalet@37.59.248.166 -p 22222"
alias nrjprod="ssh jbigalet@37.59.248.167 -p 22022"
alias appsprod="ssh jbigalet@37.59.248.168 -p 22022"
alias releveplusprod="ssh jbigalet@37.59.248.164 -p 22022"
alias barbie="ssh barbie@91.121.80.76"

alias eggshot="cd /c/Documents\ and\ Settings/Barbie/Documents/eggshot"

alias czsh="vim ~/.zshrc"
alias cvim="vim ~/.vimrc"
alias ci3="vim ~/.i3/config"
alias cxd="vim ~/.Xdefaults"

alias grips="nohup grip > /dev/null 2>&1 &"

alias cxinit="vim ~/.xinitrc"

alias reload="source ~/.zshrc"

alias pacin="sudo pacman -S"
alias pacupg="sudo pacman -Syu"

alias tarx="tar -zxvf"
alias tarc="tar -zcvf"

if [[ ${$(hostname)%%.*} == "ns3269944" ]] then
  alias dev='cd /home/theodo/crysalide/projects/devtests'
  alias inte='cd /home/theodo/crysalide/projects/devinte'
  alias cro='cd /home/theodo/crysalide/projects/croixrougefrancaise'

  . ~/.local/bin/z/z.sh

  function powerline_precmd() {
      PS1="$(/home/jbigalet/powerline-shell/powerline-shell.py $? --shell zsh 2> /dev/null)"
  }
fi

if [[ ${$(hostname)%%.*} == "jbigalet-arch" ]] then
  function powerline_precmd() {
    PS1="$(python2.7 ~/Documents/powerline-shell/powerline-shell.py $? --shell zsh 2> /dev/null)"
  }
fi

if [[ ${$(hostname)%%.*} == "ns3269944" ]] || [[ ${$(hostname)%%.*} == "jbigalet-arch" ]] then
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
fi

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


alias gr="grep -nr"

alias gs="git status"
alias ga="git add"
alias gau="git add -u"
alias gc="git commit -m"
alias gca="git commit --amend"
alias gl="git log"
alias gd="git diff"
alias gdl="git diff HEAD~1"
alias gdc="git diff --cached"
alias gpo="git push origin"

alias ping="/usr/local/share/./ping"

alias fr="setxkbmap fr"
alias nocaps="setxkbmap -option caps:escape"
alias hour="sudo ntpd -qg"

alias lock="i3lock -c 000000 -n"

autoload -U colors && colors
PS1="%{$fg_bold[red]%}%n%{$reset_color%}@%{$fg_bold[blue]%}%m %{$fg_bold[yellow]%}%~ %{$reset_color%}%% "

alias tat="tmux attach -t"

function exportimages() {
  for f in $(ls -R | find . -name '*.pdf' ); do
    mkdir -p "~/images/$f";
    pdfimages -j -p "$f" "~/images/$f/page_";
  done
}

# Add private keys to ssh-agent when first trying to ssh something
#ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'#
