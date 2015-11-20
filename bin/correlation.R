#!/usr/bin/env rscript
library(tm)
library(Rgraphviz)   

MakeCorrelation <- function (filename) {
    # Log output to logfile
	log <- file("logfile.txt")
	sink(log, append=TRUE)
	sink(log, append=TRUE, type="message")

    print(filename)
    text <- readLines(filename)
    docs <- Corpus(VectorSource(text))

    ## Replace problematic characters.
    toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
    docs <- tm_map(docs, toSpace, "/")
    docs <- tm_map(docs, toSpace, "@")
    docs <- tm_map(docs, toSpace, "\\|")

    ## Clean up the text.
    docs <- tm_map(docs, content_transformer(tolower))
    docs <- tm_map(docs, removeNumbers)
    docs <- tm_map(docs, removePunctuation)

    ## Remove English stop words.
    docs <- tm_map(docs, removeWords, stopwords("english"))

    ## Remove any other arbitrary stop words.
    docs <- tm_map(docs, removeWords, c("department", "email"))

    docs <- tm_map(docs, stripWhitespace)

    ## Expand TLAs
    toString <- content_transformer(function(x, from, to) gsub(from, to, x))
    #docs <- tm_map(docs, toString, "harbin institute technology", "HIT")
    #docs <- tm_map(docs, toString, "shenzhen institutes advanced technology", "SIAT")
    #docs <- tm_map(docs, toString, "chinese academy sciences", "CAS")

    docs <- tm_map(docs, stemDocument, language = "english")
    
    tdm <- TermDocumentMatrix(docs)

    print(tdm)

    terms <- findFreqTerms(tdm, lowfreq = 5)
    
    if (length(terms) > 20) {

        terms <- sample(terms, 20)
      
        pdf(sprintf("%s.correlation.pdf", filename))

        plot(tdm, terms = terms, corThreshold = 0.3)

        dev.off()
    }

	# Restore output to console
	sink() 
	sink(type="message")
}

args <- commandArgs(trailingOnly = TRUE)

for (arg in args) {
    MakeCorrelation(arg)
}
