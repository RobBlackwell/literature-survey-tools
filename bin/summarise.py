#!/usr/bin/env python

import nltk
from nltk.tokenize import sent_tokenize
from nltk.tokenize import word_tokenize
from nltk.probability import FreqDist 
from nltk.corpus import stopwords
import sys

# Shamelessly borrowed from https://github.com/amsqr/NaiveSumm/blob/master/naivesumm.py

class NaiveSummarizer:

	
	def summarize(self, input, num_sentences ):

		punt_list=['.',',','!','?']
		summ_sentences = []

	        sentences = sent_tokenize(input)
		lowercase_sentences =[sentence.lower() 
			for sentence in sentences]
		#print lowercase_sentences
		
		s=list(input)
		ts=''.join([ o for o in s if not o in  punt_list ]).split()
		lowercase_words=[word.lower() for word in ts]
		words = [word for word in lowercase_words if word not in stopwords.words()]
		word_frequencies = FreqDist(words)
		
		most_frequent_words = [pair[0] for pair in 
			word_frequencies.items()[:100]]

                # add sentences with the most frequent words
		for word in most_frequent_words:
			for i in range(0, len(lowercase_sentences)):
                                if len(summ_sentences) < num_sentences:
                                        if (lowercase_sentences[i] not in summ_sentences and word in lowercase_sentences[i]):
                                                summ_sentences.append(sentences[i])
                                                break
                                        
			
		# reorder the selected sentences
		summ_sentences.sort( lambda s1, s2: input.find(s1) - input.find(s2) )
		return " ".join(summ_sentences)


def main() :
  naivesum = NaiveSummarizer()
  for arg in sys.argv[1:]:
    print arg
    with open(arg) as f:
      text = f.read()
      text = text.decode('utf8')
      with open(arg + '.summary.snip','w') as f:
        s = naivesum.summarize(text,4)
        f.write(s.encode('utf8'))
   
if __name__ == "__main__":
    main()
