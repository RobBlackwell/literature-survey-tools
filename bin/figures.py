#!/usr/bin/env python
import sys
import os

def quote(s):
    return s.replace('&', '\\&') 

def header():
    print(r'\documentclass[a4paper,12pt]{article}')
    #print(r'\usepackage{graphicx}')
    print(r'\usepackage{grffile}')
    print(r'\usepackage{float}')
    print(r'\begin{document}')
    print(r'\title{Literature Survey}')
    print(r'\maketitle')

    #print(r'\section{Figures}')

def trailer():
    print(r'\end{document}')
    
def figure(filename, caption, label):
    print(r'\begin{figure}[H]')
    f, ext = os.path.splitext(filename)
    print('\\includegraphics{%s}' % filename)
    print('\\caption{%s}' % quote(caption))
    print('\\label{fig:%s}' % label)
    print(r'\end{figure}')


def figures(names):
    i = 1;
    for name in names:
        p, n = os.path.split(name)
        figure(name, n, str(i))
        i +=1;
    
if __name__ == "__main__":
    header()
    figures(sys.argv[1:])
    trailer()
