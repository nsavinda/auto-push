#!/bin/bash
input="./autoPush.config"

gitp=$(which git)
# echo $gitp

while IFS= read -r line
do
    if [[ $line != \#* ]]
    then
        path=$(awk '{print $1}' FS=';' <<< $line)
        com_msg=$(awk '{print $2}' FS=';' <<< $line)
        echo $path
        echo $com_msg
        cd $path && $gitp add .
        cd $path && $gitp commit -m "$com_msg"
        cd $path && $gitp push
        date >> $path/autopush.log
        # echo "$line"
    # else
    #     echo "$line"
    fi
done < "$input"
