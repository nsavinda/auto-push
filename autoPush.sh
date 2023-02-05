#!/bin/bash
dataFile="./autoPush.data"
gitPath=$(which git)


if [ $# -eq 0 ]
then 
    while IFS= read -r line
    do
        if [[ $line != \#* && "$line" != ""  ]]
        then
            path=$(awk '{print $1}' FS=';' <<< $line)
            com_msg=$(awk '{print $2}' FS=';' <<< $line)
            echo $path
            echo $com_msg
            cd $path && $gitPath add .
            cd $path && $gitPath commit -m "$com_msg"
            cd $path && $gitPath push
            date >> $path/autopush.log
            echo $(date) ":: Pushed $path" >> autoPush.log
        fi
    done < "$dataFile"
    exit
fi



if [[ $1 == 'l' || $1 == "-l" ]]
then
    echo $1
    c=0
    while IFS= read -r line
    do

         if [[ $line != \#* && "$line" != "" ]]
         then
            c=$(($c+1))
            echo $c $line
         fi
    done < $dataFile


elif [[ $1 == 'a' || $1 == "-a" ]]
then
    read -p "Enter path: " -r path
    read -p "Commit message: " -r msg
    echo $path';' '"'$msg'"' >> $dataFile



elif [[ $1 == 'd' || $1 == "-d" ]]
then 
    if [ -n "$2" ]
    then
    c=0
    n=0
    while IFS= read -r line
    do
        n=$(($n+1))
        if [[ $line != \#* && "$line" != "" ]]
        then
            c=$(($c+1))
            if [ $c -eq $2 ]
            then
                read -p "Are you sure delete entry  $line  (y/n)?" o </dev/tty
                echo $o
                if [[ $o == 'y' ||  $o == 'Y' ]]
                then
                    sed -i "s#$line##" $dataFile
                    sed -i '/^$/d' $dataFile
                fi
            fi
        fi
    done < $dataFile
    fi
fi
