#!/usr/bin/env python

import sys
from nltk.util import ngrams

def main() :
  for arg in sys.argv[1:]:
    print arg
    with open(arg) as f:
      text = f.read()
      text = text.decode('utf8')
      with open(arg + '.ngrams.snip','w') as f:
        n = ngrams(text.split(),3)
        for x in n:
                f.write(str.join(',', x).encode('utf8') + '\n')
   
if __name__ == "__main__":
    main()
