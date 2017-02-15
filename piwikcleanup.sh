#!/bin/bash

read "blah?First, go to Campaigns in piwik, select your date range, and select all of it and copy into vim or something. Call the file rawdata.txt. Then press any key > "

awk '{print $1, $2, $3, $4}' rawdata.txt > temp1.txt
awk '{print $5, $6, $7, $8}' rawdata.txt > temp2.txt
awk 'NF{NF-=1};1' < temp2.txt > temp3.txt
cat temp3.txt | python cleanup.py > temp4.txt
awk '{print $(NF)}' rawdata.txt | sed 's/%//g' > temp5.txt

paste temp1.txt temp4.txt temp5.txt > finaldata.txt

rm temp*.txt
