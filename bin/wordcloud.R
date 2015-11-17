#!/usr/bin/env rscript
library(tm)
library(wordcloud)

MakeWordCloud <- function (filename) {

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

    tdm <- TermDocumentMatrix(docs)
    m <- as.matrix(tdm)
    v <- sort(rowSums(m),decreasing=TRUE)
    d <- data.frame(word = names(v),freq=v)

    pdf(sprintf("%s.wordcloud.pdf", filename))

    set.seed(1234)
    wordcloud(words = d$word, freq = d$freq, min.freq = 1,
              max.words=100, random.order=FALSE, rot.per=0.35, 
              colors=brewer.pal(8, "Dark2"))

    dev.off()
}


args <- commandArgs(trailingOnly = TRUE)

for (arg in args) {
    MakeWordCloud(arg)
}

