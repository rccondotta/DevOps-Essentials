#!/bin/bash
output="$(ping -c 3 $1)" 
#echo "$output"
 
if [[ $output == *"100% packet loss"* ]]
then
        echo "The network connection to $1 is not working."
else
        echo "The network connection to $1 is working"
fi


# Move to the script's directory and run the script as: ./script_name.sh 8.8.8.8