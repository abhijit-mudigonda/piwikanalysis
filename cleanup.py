#!/usr/local/env/python


import sys
for line in sys.stdin.readlines():
    line = line.strip().split()
    if len(line) == 1:
        out = line[0][:-1]
    else:
        time = 60*int(line[0])
        time += int(line[2][:-1])
        out = str(time)
    print out
