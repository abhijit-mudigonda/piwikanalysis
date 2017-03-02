#!/bin/zsh

#Takes an input text file in argument $1 with a particular flag 
#and replaces them with the first column of the file $2 and 
#sends them to the second column of the file $2

#Let the input format have like subject and things later

bodyfile=$1
subfile=$2
outdir=$3
flag="#!---!#"
mykerb="abhijitm"

python dormspammaker.py --bodyfile $bodyfile --flag $flag --subfile $subfile --outdir $outdir
scp ${outdir}/* $mykerb@athena.dialup.mit.edu:~/dormspambot
ssh $mykerb@athena.dialup.mit.edu
rm $outdir/*



