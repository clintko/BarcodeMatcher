#' Filter reference barcodes with a given read using hamming distance
#' 
#' The reference barcodes are first constructed into a tree. Hamming distance between 
#' each barcode and the given read is calculated. The barcodes with hamming distance 
#' smaller than the specify threshold will be return.
#' 
#' @param barcodes the file path of the fasta file
#' @param read the output file path of the fastq sequence
#' 
#' @export
#' @examples
#' out = hamming_filter(c("ATTCG", "ATTCA", "AAAAA", "AATAA"), "ATTCG")
#' out == c("ATTCA", "ATTCG") # TRUE TRUE
hamming_filter = function(barcodes, read, threshold = 2) {
    system("rm -f barcodes_filter.dat")
    hamming_filter_wrapper(barcodes, read, threshold)
    
    out = read.table("barcodes_filter.dat", header = FALSE, stringsAsFactors = FALSE)
    out = out$V1
    system("rm -f barcodes_filter.dat")
    
    return(out)
} # end func