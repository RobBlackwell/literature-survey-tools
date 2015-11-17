#!/usr/bin/env rscript
library(tm)
library(ggplot2)   

MakeFreq <- function (filename) {

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
    docs <- tm_map(docs, toString, "harbin institute technology", "HIT")
    docs <- tm_map(docs, toString, "shenzhen institutes advanced technology", "SIAT")
    docs <- tm_map(docs, toString, "chinese academy sciences", "CAS")

    docs <- tm_map(docs, stemDocument, language = "english")

    dtm <- DocumentTermMatrix(docs) 
    freq = sort(colSums(as.matrix(dtm)),decreasing = T)


    wf <- data.frame(word=names(freq), freq=freq)
    
    wfplot <- wf[1:20,]
    
    p <- ggplot(wfplot, aes(word, freq)) +
        geom_bar(stat="identity")+
        theme(axis.text.x=element_text(angle=45, hjust = 1))

    ggsave(p, file=sprintf("%s.freq.pdf", filename))

}

args <- commandArgs(trailingOnly = TRUE)

for (arg in args) {
    MakeFreq(arg)
}


