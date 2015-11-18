#!/usr/bin/env rscript

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
