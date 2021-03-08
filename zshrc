zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' file-sort date
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
alias ll="ls -Ahltr --color=auto"
alias grep="grep --color=auto"

alias barbie="ssh barbie@91.121.80.76"

alias czsh="vim ~/.zshrc"
alias cvim="vim ~/.vimrc"
alias ci3="vim -O ~/.i3/config ~/.this/i3/config"
alias ci3s="vim -O ~/.i3/i3status.conf ~/.this/i3/i3status.conf"
alias cxr="vim -O ~/.Xresources ~/.this/Xresources"
alias cxinit="vim ~/.xinitrc"

alias vsd="mv ~/.drircb ~/.drirc"
alias vse="mv ~/.drirc ~/.drircb"

alias grips="nohup grip > /dev/null 2>&1 &"

alias reload="source ~/.zshrc"

alias pacin="sudo pacman -S"
alias pacupd="sudo pacman -Sy"
alias pacupg="sudo pacman -Syu"

alias tarx="tar -zxvf"
alias tarc="tar -zcvf"

# . ~/.bin/packages/z/z.sh

# if [[ ${$(hostname)%%.*} == "jbigalet-arch" ]] then
#   function powerline_precmd() {
#     PS1="$(python2.7 ~/Documents/powerline-shell/powerline-shell.py $? --shell zsh 2> /dev/null)"
#   }

#   function install_powerline_precmd() {
#     for s in "${precmd_functions[@]}"; do
#       if [ "$s" = "powerline_precmd" ]; then
#         return
#       fi
#     done
#     precmd_functions+=(powerline_precmd)
#   }

#   if [ "$TERM" != "linux" ]; then
#       install_powerline_precmd
#   fi
# fi


function unfk_unzip() {
    mkdir ${1%".zip"} && unzip -Z1 $1 | xargs -d'\n' mv -t ${1%".zip"}
}

function unfk_unrar() {
    mkdir ${1%".rar"} && unrar lb $1 | xargs -d'\n' mv -t ${1%".rar"}
}


alias gr="grep -nr"


# function git() {
#     if pwd | grep /mnt/c > /dev/null; then
#         exec /mnt/c/Program\ Files/Git/cmd/git.exe "$@"
#     else
#         exec /usr/bin/git "$@"
#     fi
# }
alias git="/mnt/c/Program\ Files/Git/cmd/git.exe"


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
alias gdlc="git diff HEAD~1 HEAD"
alias gdc="git diff --cached"
alias gdp="git diff @{1}.."
alias gp="git push"
alias gpo="git push origin"
alias gpc='git push origin "$(git rev-parse --abbrev-ref HEAD)"'
alias gg="git pull --rebase"
alias ggo="git pull --rebase origin"
alias ggc='git pull --rebase origin "$(git rev-parse --abbrev-ref HEAD)"'
alias gb="git branch -vv"
alias gba="git branch -vv --all"
alias gbs="git branch"
alias gt="git stash"
alias gtp="git stash pop"
alias gtf="git stash show"
alias gtd="git stash show -p"
alias gtl="git stash list"
alias gh="git checkout"
# __git_complete gh _git_checkout
alias ghn="git checkout -B"
# __git_complete ghn _git_checkout
alias gf="git fetch"
alias gfa="git fetch --all"
alias gfo="git fetch origin"
alias gfoa="git fetch --all origin"
alias gym="git merge"
alias gymm="git merge master"
alias gyr="git rebase"
alias gyrc="git rebase --continue"
alias gyra="git rebase --abort"
alias gyrm="git rebase master"
alias grs="git config --get remote.origin.url"
alias ge="git reflog"
alias -g nostf="-- . ':!Levels/*'"

export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet

# alias ping="/usr/local/share/./ping"

alias fr="setxkbmap fr"
alias nocaps="setxkbmap -option caps:escape"
alias hour="sudo ntpd -qg"

alias lock="i3lock -c 000000 -n"

alias snap="~/.this/bin/./snap"

s() {
    local d=$(date '+%Y-%m-%d__%H-%M-%S')
    xwd -name ":-)" | convert xwd: ~/shots/${d}.png
}

autoload -U colors && colors

alias tat="tmux attach -t"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function ass() {
  as $1.s -o obj/$1.o
  ld obj/$1.o -o bin/$1
  ./bin/$1
}

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

alias whoop="mplayer ~/whoop.mp3"

function mkdir_cd() {
  mkdir -p $1
  cd $1
}
alias cm=mkdir_cd

function agi() {
    local f="ag "
    for p in "${@:1:$#@-1}"; do  # foreach arg except the last
        f="$f --ignore \"*.$p\"";
    done
    f="$f ${@: -1}"  # append last arg (needed space)
    eval $f
}

alias update_pacman_mirrors="sudo reflector --verbose -l 100 -p http --sort rate --save /etc/pacman.d/mirrorlist"

# source ~/.bin/zsh-git-prompt/zshrc.sh
# GIT_PROMPT_EXECUTABLE="haskell"
PS1="%{$fg_bold[red]%}%n%{$reset_color%}@%{$fg_bold[blue]%}%m %{$fg_bold[yellow]%}%~ %{$reset_color%}%% "
# RPROMPT='$(git_super_status)'

# source ~/.bin/packages/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
