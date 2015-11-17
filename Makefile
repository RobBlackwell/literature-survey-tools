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

wordclouds:
	bin/wordcloud.R tmp/*.txt

freqs:
	bin/freq.R tmp/*.txt

correlations:
	bin/correlation.R tmp/*.txt

doc:
	bin/figures.py tmp/*.pdf > index.tex
	pdflatex index.tex
