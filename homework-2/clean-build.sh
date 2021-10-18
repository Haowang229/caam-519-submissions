#! /bin/bash
echo "Project name?"
read project
# ask for user prompt for input project name
if [ ! -d "$PWD/.build" ]
   then
   mkdir .build
fi
# if the hidden directory doesn't exist, create one
pdflatex -aux-directory=$PWD/.build -output-directory=$PWD $project.tex
# run the file with pdflatex and save aux files to the .build directory and pdf output to the current directory
