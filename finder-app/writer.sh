#!/bin/bash

#Assignment 1 AESD Nicholas Buckley writer script 
writefile=$1

writestr=$2

#Check argument count...
if [ $# -lt 2 ]
then #if it's less than required exit error 1 and print

    echo "$# is not enough arguments."
    echo "Please specify a /path/file and a string to be writen in the file!"
    exit 1
    
else # Number of arguments are valid! (or greater)...
    
    #count the number of words in the give path (count the directories)
    numberOfDirs=$(echo $writefile | tr '/' '\n' | wc -l)
    ((numberOfDirs-= 1))
    
    for i in $(seq 1 $numberOfDirs) 
    do
        # make each directory 1 by 1
    	directory=$(echo $writefile | cut -d '/' -f "$i")
    	fullPath+="$directory/"
        mkdir $fullPath &> "/dev/null"

    done
    
    #try to make the file!
    touch $writefile
    
    if [ $? -gt 0 ]
    then 
        echo "File could not be created to be written too"
        exit 1
    else
    	echo "$writestr" > "$writefile"
    	echo "File $writefile successfully was written too!"
    fi

fi
