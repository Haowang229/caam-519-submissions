#! /bin/bash

sum=0

dirct () {
for file in $1/*
do
  if [ -f $file ]
  then
    Files $file
  else
    dirct $file
  fi
done
}
# a function called when the argument is a directory, it search the contents inside it, if the cotent is a file call Files(), if it's still a directory call itself
Files () {
  lines=$(wc -l $1 2>&1 | cut -d " " -f 1)
  sum=$((sum+$lines))
}
# a function called when the argument is a file, it uses wc and cut to get the number of lines and add to sum

for i in $@
do
  if [ -f $i ] 
  then
    Files $i
  else
    dirct $i
  fi
done
# main program handling the case when there are multple arguments being passed
echo $sum
