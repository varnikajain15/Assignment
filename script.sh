#!/bin/bash

seconds=0

read -p "Enter number of seconds > " seconds

hours=$((seconds / 3600))
seconds=$((seconds % 3600))
minutes=$((seconds / 60))
seconds=$((seconds % 60))

echo "$hours hour(s) $minutes minute(s) $seconds second(s)"


echo "So do you want to try again?"
read  - p "Enter Y or N > " ans

if [ $ans -eq  Y]
then
. script.sh
else 
echo "Thank You"
fi 
