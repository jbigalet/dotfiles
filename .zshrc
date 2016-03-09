zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=1000000
setopt appendhistory autocd
bindkey -v

bindkey -v
bindkey "^R" history-incremental-search-backward

export EDITOR=vim

alias ls="ls --color=auto"
alias ll="ls -ahltr --color=auto"
alias grep="grep --color=auto"

alias barbie="ssh barbie@91.121.80.76"

alias czsh="vim ~/.zshrc"
alias cvim="vim ~/.vimrc"
alias ci3="vim ~/.i3/config"
alias cxr="vim ~/.Xresources"
alias cxinit="vim ~/.xinitrc"

alias grips="nohup grip > /dev/null 2>&1 &"

alias reload="source ~/.zshrc"

alias pacin="sudo pacman -S"
alias pacupg="sudo pacman -Syu"

alias tarx="tar -zxvf"
alias tarc="tar -zcvf"

. ~/.bin/packages/z/z.sh

if [[ ${$(hostname)%%.*} == "jbigalet-arch" ]] then
  function powerline_precmd() {
    PS1="$(python2.7 ~/Documents/powerline-shell/powerline-shell.py $? --shell zsh 2> /dev/null)"
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
fi


alias gr="grep -nr"


# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

alias g="git clone"
alias gs="git status -sb"
alias gss="git status"
alias ga="git add"
alias gau="git add -u"
alias gc="git commit -m"
alias gca="git commit --amend"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gls="git log"
alias gd="git diff"
alias gm="git diff --name-only --diff-filter=U"
alias gdl="git diff HEAD~1"
alias gdc="git diff --cached"
alias gdp="git diff @{1}.."
alias gp="git push origin master"
alias gpo="git push origin"
alias gg="git pull --rebase origin master"
alias ggo="git pull --rebase origin"
alias gb="git branch"
alias gbl="git branch -vv"
alias gt="git stash"
alias gtp="git stash pop"

# alias ping="/usr/local/share/./ping"

alias fr="setxkbmap fr"
alias nocaps="setxkbmap -option caps:escape"
alias hour="sudo ntpd -qg"

alias lock="i3lock -c 000000 -n"

autoload -U colors && colors
PS1="%{$fg_bold[red]%}%n%{$reset_color%}@%{$fg_bold[blue]%}%m %{$fg_bold[yellow]%}%~ %{$reset_color%}%% "

alias tat="tmux attach -t"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if (( $+commands[thefuck] ))
then
  eval $(thefuck --alias)
  alias fk="fuck"
fi

if (( $+commands[how2] ))
then
  alias how="how2"
fi

alias e="vim"

function mkdir_cd() {
  mkdir -p $1
  cd $1
}
alias cm=mkdir_cd

source ~/.bin/packages/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
