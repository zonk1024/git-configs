#!/bin/bash

REPO_DIR="${REPO_DIR:-code}"
GIT_CONFIG_LINK_TARGET="${REPO_DIR}/git-configs/gitconfig"
GIT_IGNORE_LINK_TARGET="${REPO_DIR}/git-configs/gitignore"

# project dir
cd ~
if [ ! -d "${REPO_DIR}" ]; then
  echo "Creating dir ${REPO_DIR}"
  mkdir "${REPO_DIR}"
fi

# teh repo
cd ${REPO_DIR}
if [ ! -d "git-configs" ]; then
  echo "Cloning git-configs"
  git clone https://github.com/zonk1024/git-configs.git 2>/dev/null
fi

cd git-configs
if [ ! -f gitconfig -o ! -f gitignore ]; then
  echo "Your email address?"
  read EMAIL
  echo "Your full name?"
  read FULL_NAME
  cat gitconfig.template | sed "s/EMAIL/${EMAIL}/g" | sed "s/FULL_NAME/${FULL_NAME}/g" >gitconfig
  cat gitignore.template | sed "s/EMAIL/${EMAIL}/g" | sed "s/FULL_NAME/${FULL_NAME}/g" >gitignore
fi

# let's not make people hate us
cd ~
if [ -f ~/.gitconfig ]; then
  if [ ! -L ~/.gitconfig ]; then
    echo "ERROR!" >&2
    echo "Your ~/.gitconfig file is not a symlink.  As a safety precaution you must first move (ideally" >&2
    echo "to a backup location) ~/.gitconfig before this program is allowed to manage your .gitconfig" >&2
    exit 1
  fi
  rm -f .gitconfig
fi
ln -s ${GIT_CONFIG_LINK_TARGET} .gitconfig
if [ -f ~/.gitignore ]; then
  if [ ! -L ~/.gitignore ]; then
    echo "ERROR!" >&2
    echo "Your ~/.gitignore file is not a symlink.  As a safety precaution you must first move (ideally" >&2
    echo "to a backup location) ~/.gitignore before this program is allowed to manage your .gitignore" >&2
    exit 2
  fi
  rm -f .gitignore
fi
ln -s ${GIT_IGNORE_LINK_TARGET} .gitignore
