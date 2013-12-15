#!/bin/bash
# Sets up the .vim symlink.

#switch to dir where setup is
BASEDIR=$(dirname $0)
cd $BASEDIR

if [ -d "${HOME}/.vim" ]; then
	echo "WARNING - ~/.vim already exists. \nCannot set up .vim" 
	exit 1
fi 

if [ -h "${HOME}/.vim" ]; then
	echo "WARNING - sym link '~/.vim' already exists \nCannot set up .vim..."
fi

echo "Setting up .vim..."
CDIR=$(pwd)
ln -s ${CDIR} ${HOME}/.vim
echo "SUCCESS!" 
exit 0
