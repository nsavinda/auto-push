#!/bin/bash
input="./autoPush.config"

echo $1

if [ $# -eq 0 ]
then 
    echo "Usage: autoPushE.sh [l|a|d] [n]"
    exit
fi


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


elif [ $1 == 'a' ]
then
    read -p "Enter path: " -r path
    read -p "Commit message: " -r msg
    echo $path '"'$msg'"' >> $input




elif [ $1 == 'd' ]
then 
    if [ -n "$2" ]
    then
    c=0
    n=0
    while IFS= read -r line
    do
        n=$(($n+1))
        if [[ $line != \#* ]]
        then
            c=$(($c+1))
            if [ $c -eq $2 ]
            then
                # echo "Are you sure delete entry " $line
                read -p "Are you sure delete entry  $line  (y/n)?" o </dev/tty
                echo $o
                if [[ $o == 'y' ||  $o == 'Y' ]]
                then
                # echo $line
                # echo "\"$line\"d"
                
                # sed "\"$line\"d" < autoPush.config
                    sed -i "s#$line##" autoPush.config
                    sed -i '/^$/d' autoPush.config
                fi
                # if [ $o == 'y' ]
                # then
                #     echo '"${line}"d'
                # fi
            fi

            # echo $c $line
        fi
    done < $input
    fi

fi
