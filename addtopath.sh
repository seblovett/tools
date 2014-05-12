#!/bin/bash
# @file addtopath.sh
# Date Created: Mon 24 Feb 2014 22:29:17 GMT by seblovett on seblovett-Ubuntu
# <+Last Edited: Mon 24 Feb 2014 22:34:59 GMT by seblovett on seblovett-Ubuntu +>
#Adds the current working dir to path

currentdir=$(pwd)
echo $currentdir
export PATH=$PATH:$currentdir

echo $PATH
