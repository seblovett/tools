#!/bin/bash
#Written by seblovett
#will set up some simlinks and things for linux.
#<+ Last Edited: +>

#store current dir
DIR=$(pwd) 
echo $DIR
cd ~
#Set up .vimrc and .vim folder
if [ -f ~/.vimrc ]; then
	echo ".vimrc already exists"
	#@todo make this interactive
	rm ~/.vimrc
fi

ln ${DIR}/.vimrc .vimrc
echo ".vimrc set up!"

if [ -d ~/.vim ]; then
	echo ".vim already exists"
	#@todo make this interactive
	rm -rf .vim
elif [ -h ~/.vim ]; then
	rm .vim
fi

ln -s ${DIR}/vim .vim
echo ".vim set up!"

#Set up .screenrc

if [ -f ~/.screenrc ]; then
	echo ".screenrc already exists"
	#@todo make this interactive
	rm .screenrc
elif [ -h ~/.screenrc ]; then
	rm .screenrc
fi

ln ${DIR}/.screenrc .screenrc
echo ".screenrc set up!"

#Set up .gitconfig
#if [ -f ~/.gitconfig ]; then
#	echo ".gitconfig already exists"
#	#@todo make this interactive
#	rm ~/.gitconfig
#fi
#add the tools dir to path
#make a backup
cp .bashrc .bashrc.backup
# @todo this is unstable... need to check the file 
echo "export PATH=${DIR}:\${PATH}" >> .bashrc
echo COMPLETE
