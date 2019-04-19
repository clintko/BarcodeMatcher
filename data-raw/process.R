fasta = read.table("./data-raw/fasta.dat", header = FALSE)
fastq = read.table("./data-raw/fastq.dat", header = FALSE)
phred = read.table("./data-raw/phred.dat", header = FALSE)

usethis::use_data(fasta, fastq, phred, overwrite = TRUE)