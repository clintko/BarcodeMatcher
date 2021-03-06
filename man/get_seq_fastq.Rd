% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_seq_fastq.R
\name{get_seq_fastq}
\alias{get_seq_fastq}
\title{Extract sequence of reads from fastq file}
\usage{
get_seq_fastq(filepath, outfile)
}
\arguments{
\item{filepath}{the file path of the fasta file}

\item{outfile}{the output file path of the fastq sequence}
}
\description{
Read in the fastq file line by line. Discard all information except for sequence.
Sequence is output to a file
}
