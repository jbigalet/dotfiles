#!/bin/bash

echo "updating submodules...."
sed -i -e "s/= .* # local/= $(cat /etc/hostname) # local/" ~/dotfiles/.gitmodules
cd ~/dotfiles && git submodule update --init --recursive --remote

# create branch for local dotfiles if it does not exists
echo "creating branch for local dotfile....."
cd ~/dotfiles/this && git checkout -B `cat /etc/hostname`

cd ~/dotfiles

# stash uncommited dotfiles
echo "looking for local changes...."
if [[ `git status | grep "nothing to commit" | wc -l` -ne 1 ]];then
  echo "you have uncomitted changes - stashing"
  git stash -u
fi

echo "pulling....."
git pull origin master


bckdir=~/dotfiles-bck/`date +%Y.%m.%d-%H:%M:%S`

echo "linking files...."
for f in ~/dotfiles/*
do
  base=`basename $f`

  if [[ $base != install.sh ]]
  then

    dest=~/.$base

    if [ -L $dest ];then
      rm $dest
    elif [ -e $dest ]; then
      echo "backuping existing file: $base"
      mkdir -p $bckdir
      mv $dest $bckdir/$base
    fi

    ln -s $f $dest

  fi
done

