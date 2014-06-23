#!/bin/bash
git config --global user.name "Chris Jacobs"
git config --global user.email "zonk1024@gmail.com"
git config --global color.ui auto
git config --global alias.po "push origin"
git config --global alias.pom "push origin master"
git config --global alias.ms "merge --no-ff --no-commit"
git config --global alias.mm "merge --no-ff --no-commit master"
git config --global alias.dm "diff master"
git config --global alias.dm2 "diff master --color-words=. -w"
git config --global alias.dmo "diff master --name-only"
git config --global alias.dms "diff master --name-status"
git config --global alias.dh "diff HEAD"
git config --global alias.dho "diff HEAD --name-only"
git config --global alias.dhs "diff HEAD --name-status"
git config --global alias.f "fetch"
git config --global alias.rh "reset --hard"
git config --global alias.st "status"
git config --global alias.co "checkout"
git config --global alias.coh "checkout HEAD"
git config --global core.editor vi
git config --global diff.tool vimdiff
git config --global difftool.prompt false
git config --global core.excludesfile "~/.gitignore"

# TY Scott Chacon
git config --global alias.lol "log --oneline --decorate --graph"

# TY mackstann
git config --global alias.d2 "diff --color-words=. -w"
git config --global merge.conflictstyle diff3

if [ ! -f "~/.gitignore" ]; then
  wget -O "~/.gitignore" "https://raw.githubusercontent.com/zonk1024/git-configs/master/.gitconfig"
else
  wget -O "/dev/shm/git-stuffs.$$" "https://raw.githubusercontent.com/zonk1024/git-configs/master/.gitconfig"
  cat "~/.gitignore" >> /dev/shm/git-stuffs.$$
  sort "/dev/shm/git-stuffs.$$" | uniq > ~/.gitignore
fi 
