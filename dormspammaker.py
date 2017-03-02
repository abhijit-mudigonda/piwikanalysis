#!/usr/local/env python

from argparse import ArgumentParser

def main():
    parser = ArgumentParser()
    parser.add_argument("--bodyfile", action = "store", required = True)
    parser.add_argument("--flag", action = "store", help = "Text to replace, default is #!---!#", default = "#!---!#")
    parser.add_argument("--subfile", action = "store", required = True)
    parser.add_argument("--outdir", action = "store", required = True)
    o = parser.parse_args()

    subfile = open(o.subfile, 'r')
    
    flag = o.flag
    for line in subfile:
        bodyfile = open(o.bodyfile, 'r')
        subtext, recipemail = line.strip().split()
        recip = recipemail.rsplit('@',1)[0]
        outfile = open(o.outdir+recip+".txt",'w')
        for bodyline in bodyfile:
            bodyline = bodyline
            outline = bodyline.replace(flag, subtext)
            outfile.write(outline)
        bodyfile.close()

if __name__ == "__main__":
    main()
