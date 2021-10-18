#! /bin/bash
if [ $# -eq 1 ] && [ "$1" == "-h" ]
then
  echo "Poetry.sh program generates a table that contains name of students as the first column, the poetry as the second column and the first 7 characters of poety as the third column"
# Test if there is only -h flag being passed here, if it is, print the help message
else
  file = $1
  awk '/tuden/' $file >> save1.txt
# save lines with student in save1
  awk '/Poe/' $file | cut -b 7- >> save2.txt
# cut and save content of poetry into save2
  cat save2.txt | cut -b 1-7 >> save3.txt
# cut and save first 7 characters into save3
  paste save3.txt save2.txt
  paste save2.txt save1.txt
  awk 'BEGIN { FS=":"; print "Student_ID\tFavorite poem\tFirst_7_chars_of_poem"; }{print $1,"\t",$2,"\t",$3;}
  END' save1.txt
# paste and print the table
  rm save[1..3].txt
fi
