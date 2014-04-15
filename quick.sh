#!/bin/bash

git config --global user.name "Chris Jacobs"
git config --global user.email "zonk1024@gmail.com"
git config --global color.ui auto
# TY Scott Chacon
git config --global alias.lol "log --oneline --decorate --graph"
git config --global alias.po "push origin"
git config --global alias.pom "push origin master"
git config --global alias.ms "merge --no-ff --no-commit"
git config --global alias.mm "merge --no-ff --no-commit master"
git config --global alias.dm "diff master"
git config --global alias.dmo "diff master --name-only"
git config --global alias.dms "diff master --name-status"
git config --global alias.dh "diff HEAD"
git config --global alias.dho "diff HEAD --name-only"
git config --global alias.dhs "diff HEAD --name-status"
git config --global alias.d2 "diff --color-words=. -w"
# TY mackstann
git config --global alias.cm "commit -am 'merged in master'"
git config --global alias.f "fetch"
git config --global alias.rh "reset --hard"
git config --global alias.st "status"
git config --global alias.co "checkout"
git config --global core.editor vi
git config --global diff.tool vimdiff
git config --global difftool.prompt false
git config --global merge.conflictstyle diff3
# TY mackstann
