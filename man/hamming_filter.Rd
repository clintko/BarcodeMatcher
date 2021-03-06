% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hamming_filter.R
\name{hamming_filter}
\alias{hamming_filter}
\title{Filter reference barcodes with a given read using hamming distance}
\usage{
hamming_filter(barcodes, read, threshold = 2)
}
\arguments{
\item{barcodes}{the file path of the fasta file}

\item{read}{the output file path of the fastq sequence}
}
\description{
The reference barcodes are first constructed into a tree. Hamming distance between 
each barcode and the given read is calculated. The barcodes with hamming distance 
smaller than the specify threshold will be return.
}
\examples{
out = hamming_filter(c("ATTCG", "ATTCA", "AAAAA", "AATAA"), "ATTCG")
out == c("ATTCA", "ATTCG") # TRUE TRUE
}
