#! /bin/bash
web="https://poets.org/search?combine="
for ((i=1;i<=$#;i++)) 
do
  w3m "$web/$($i)" | grep "$($i)"
done
