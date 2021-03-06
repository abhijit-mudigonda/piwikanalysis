#!/bin/bash

clear

directory=$1

for f in $directory/*\ *; do mv "$f" "${f// /_}"; done
for f in $directory/*.docx; do soffice --headless --convert-to "txt:Text (encoded):UTF8" "$f" --outdir $directory; done 

rm $directory/*.docx
