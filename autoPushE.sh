#!/bin/bash
input="./autoPush.config"

echo $1

if [ $1 == 'l' ]
then
    echo $1
    c=0
    while IFS= read -r line
    do

         if [[ $line != \#* ]]
         then
            c=$(($c+1))
            echo $c $line
         fi
    done < $input
fi

if [ $1 == 'a' ]
then
    read -p "Enter path: " -r path
    read -p "Commit message: " -r msg
    echo $path '"'$msg'"' >> $input
fi



