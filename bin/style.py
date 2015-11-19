#!/usr/local/bin/python
import sys
from textstat.textstat import textstat

# Calculates some readability statistics.

def main() :
  for arg in sys.argv[1:]:
    with open(arg) as f:
      text = f.read()

    with open(arg + '.readability.snip','w') as f:
       f.write ("syllable_count : %s\n" % textstat.syllable_count(text))
       f.write ("lexicon_count : %s\n" % textstat.lexicon_count(text))
       f.write ("sentence_count : %s\n" % textstat.sentence_count(text))
       f.write ("difficult_words : %s\n" % textstat.difficult_words(text))
       f.write ("flesch_reading_ease : %s\n" % textstat.flesch_reading_ease(text))
       f.write ("flesch_kincaid_grade : %s\n" % textstat.flesch_kincaid_grade(text))
       f.write ("smog_index : %s\n" % textstat.smog_index(text))
       f.write ("automated_readability_index : %s\n" % textstat.automated_readability_index(text))
       f.write ("coleman_liau_index : %s\n" % textstat.coleman_liau_index(text))
       f.write ("linsear_write_formula : %s\n" % textstat.linsear_write_formula(text))
       f.write ("dale_chall_readability_score : %s\n" % textstat.dale_chall_readability_score(text))
       #f.write ("readability_consensus : %s\n" % textstat.readability_consensus(text))
   
if __name__ == "__main__":
    main()
