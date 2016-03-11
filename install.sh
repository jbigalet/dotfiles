#!/bin/bash

function clog {
  echo -e "\033[44m\033[1;37m$1"
}

clog "updating local branch in gitmodules"
sed -i -e "s/= .* # local/= $(cat /etc/hostname) # local/" ~/dotfiles/.gitmodules

clog "updating submodules"
cd ~/dotfiles && git submodule update --init --recursive --remote

clog "creating branch for local dotfile"
cd ~/dotfiles/this && git checkout -B `cat /etc/hostname`

cd ~/dotfiles

# stash uncommited dotfiles
clog "looking for local changes"
if [[ `git status | grep "nothing to commit" | wc -l` -ne 1 ]]
then
  clog "you have uncomitted changes - stashing"
  git stash -u
fi

clog "pulling"
git pull origin master


bckdir=~/dotfiles-bck/`date +%Y.%m.%d-%H:%M:%S`

clog "linking files"
for f in ~/dotfiles/*
do
  base=`basename $f`

  if [[ $base != install.sh ]]
  then

    dest=~/.$base

    if [ -L $dest ];then
      rm $dest
    elif [ -e $dest ]; then
      clog "backing up existing file: $base"
      mkdir -p $bckdir
      mv $dest $bckdir/$base
    fi

    ln -s $f $dest

  fi
done

