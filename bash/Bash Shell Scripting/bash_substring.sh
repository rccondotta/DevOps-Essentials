#!/bin/bash
  
str1="Nowadays, Linux powers the servers of the Internet."
if [[ “$str1” == *"Linux"* ]]
then
        echo "The substring Linux is there."
else
        echo "The substring Linux IS NOT there"
fi


my_str="abc"
if [[ -z "$my_str" ]]
then
        echo "String is zero length."
else
        echo "String IS NOT zero length."
fi
 
if [[ -n "$my_str" ]]
then
        echo "String IS NOT zero length"
else
        echo "String is zero length"
fi
