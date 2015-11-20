# Literature Survey Tools

This project contains some scripts that do some basic text analytics
on a collection of documents, producing wordclouds and term
correlation diagrams that may be useful as part of a literature
review.

## Strategy

Put your documents in the data subdirectory. These can be in PDF, DOCX
etc format.

Tika is then used to convert everything to text files, stored in the
tmp subdirectory.

wordcloud.R is a script that creates wordclouds for text files.

correlation.R produces term correlation diagrams.

freq.R produces word histograms.

figures.py is then used to pull the diagrams together into a summary
latex document.

A Makefile is provided to glue the pieces together.

## Tika

Tika is used to convert documents from their native formats (PDF, DOCX
etc) into text.

The jar file is included in the lib directory, but you must have
[a working Java JDK](http://www.oracle.com/technetwork/java/javase/downloads/index.html).

Typing

	make tika

converts all the files from data, placing output in tmp.

## R Dependencies

Parts of this project are written in R, so you need to have a working
R environment.  One way to do this is via [Homebrew](http://brew.sh).

	brew install r

You then need to install some libraries, and the provided install.R
script will do this for you. You can run it directly, or type

	make install

## Producing Wordclouds

The script wordcloud.R takes as its argument, one or more text
files. For each file it produces a wordcloud, saving it alongside the
text file with the suffix .wordcloud.pdf.

You can run the script directly,

	bin/wordcloud.R tmp/*.txt

or type

	make wordclouds

This will create a wordcloud for each text file in the tmp
subdirectory.

## Producing Correlation Diagrams

The script correlation.R takes as its argument, one or more text
files. For each file it produces a correlation diagram, saving it
alongside the text file with the suffix .correlation.pdf.

You can run the script directly,

	bin/correlation.R tmp/*.txt

or type

	make correlations

This will create a wordcloud for each text file in the tmp subdirectory.

## Creating one big file

figures.py takes a bunch of PDF files as its argument and generates a
Latex document with all teh PDFs listed as figures.

The easiest way to run it is

    make doc

## Readability Analysis

Computes some readability index scores.

	make styles

## Text Summarisation

Not particulalrly good at the moment. Slow but demonstrates the
principle. There must be better algorithms?

	make summaries

## Ngrams

	make ngrams

## Brain dump ideas

Instead of generating a PDF, build an HTML web site, so that cross
referencing and linking are all hypertext links. Each document gets a
page that includes the wordcloud, readability analysis, summary and
link to the original document. A "contents page" gives a sorted list
of docs to click through to. An index links keywords to each paper in
which they are present.

Use tika to generate HTML versions of the docs to include.

Process HTML versions of docs to include anchor tags to allow linking
straight into the body of a document.

Get the R scripts to target SVG rather than PDF so that the content
can be used on the web.

Find key concepts .. "weed control" etc and make these hyperlinks to
wikipedia or other online references or local knowledge base.

Look at document similarity and group documents that cover the same
subject matter.

Look harder at ngram analysis. Rank the ngrams and use these as a
measure of importance and document similarity.

Can we parse the References section to see if papers in the corpus are
cross referenced and hyperlink them?

Could we get more structure from the papers if we had their original
TeX sources ratherthan PDF?

Build a web structure where each document is given a URI. Build a
RESTful structure /docs/1/index.html /docs/1/wordcloud.svg etc. Think
semantic web.

Consider using RDF to build machine readable metadata structure around
the documents. Could we construct a semantic web database and run
SPARQL queries across the content?

Are there any microformats
http://microformats.org/wiki/what-are-microformats that would be
useful?

Consider using SOLR or similar to build a free text index and search
engine over the corpus.

Can we find these papers and link to them on external systems -
e.g. ResearchGate or their library reference?

Can we generate BibTex or similar to allow easy referencing? What
about Mendeley?

Can we build an annotation system to allow experts to add their
comments and "pencil in the margin". http://genius.com/developers

Can we measure the "information content" of a paragraph and use this
to delete all the "non information", cover sheets and other guff?

Can we pull out the diagrams and present these with the summary?

A picture is worth a thousand words - can we build better
visualisations of documents - thumbnailed pages. Infographics.

Turn the readability scores into graphs or traffic light indicators.

What can we do with named entity recognisers NER? Can we identify,
authors, institutions, plant types, etc and turn these into links?

Can we use NER to identify placenames and locations and draw a map of
the areas which the papers cover?

NLTK may not up to the job??? What other NLP toolkits are out there?
The ngrams shows up limitations in the sentence tokeniser
particularly.

What do we do about pesky unicode encoding .. the Python stuff seems
ugly to keep worrying about UTF-8 and character sets?

What can we learn from http://nlp.stanford.edu http://lac.essex.ac.uk
https://opennlp.apache.org https://gate.ac.uk
https://uima.apache.org/doc-uima-why.html

Can we use Case Based Reasoning
https://en.wikipedia.org/wiki/Case-based_reasoning techniques to build
a web app that allows somebody to describe their issue and compare it
to past cases .. a kind of domain specific "super" search?

## Notes

This is very much a work in progress. It's messy code and can only be
thought of as first prototypes.  Contributions welcome.

Works on Mac OS X. Thought to work on Linux. Might work on Windows.


Dr Stephen Hallett <s.hallett@cranfield.ac.uk>    
Jason Carvalho<j.carvalho@cranfield.ac.uk>    
Rob Blackwell <rob.blackwell@cranfield.ac.uk>    
November 2015


