#!/usr/bin/env rscript

# Log output to logfile
log <- file("logfile.txt")
sink(log, append=TRUE)
sink(log, append=TRUE, type="message")

# Use UK repository
r <- getOption("repos")
r["CRAN"] <- "http://cran.uk.r-project.org"
options(repos = r)
rm(r)

install.packages("tm")
install.packages("SnowballC")

source("https://bioconductor.org/biocLite.R")
biocLite("Rgraphviz")

install.packages("wordcloud")
install.packages("ggplot2")

# Restore output to console
sink() 
sink(type="message")
