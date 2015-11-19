TEMP = tmp
DATA = data

clean:
	rm $(TEMP)/*
	rm index.*
	rm Rplots.pdf

tika:
	java -jar lib/tika-app-1.9.jar --text -i $(DATA) --outputDir $(TEMP) 

install:
	bin/install.R
	pip install nltk
	pip install textstat
	bin/install.py

wordclouds:
	bin/wordcloud.R tmp/*.txt

freqs:
	bin/freq.R tmp/*.txt

correlations:
	bin/correlation.R tmp/*.txt

styles:
	bin/style.py tmp/*.txt


doc:
	bin/figures.py tmp/*.pdf > index.tex
	pdflatex index.tex
