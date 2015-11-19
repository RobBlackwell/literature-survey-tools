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

## Notes

This is very much a work in progress! Contributions welcome.

Works on Mac OS X. Thought to work on Linux. Might work on Windows.


Dr Stephen Hallett <s.hallett@cranfield.ac.uk>    
Rob Blackwell <rob.blackwell@robblackwell.org.uk>    
November 2015


