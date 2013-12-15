#!bin/bash
#Written by seblovett
#will set up some simlinks and things for linux.


#store current dir
OLDDIR=${pwd} 

#switch to dir where setup is
BASEDIR=$(dirname $0)
cd $BASEDIR

#set the vim up.
cd vim
sh setup.sh
cd ..
