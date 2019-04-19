#' Extract sequence of reads from fastq file
#' 
#' Read in the fastq file line by line. Discard all information except for sequence.
#' Sequence is output to a file
#' 
#' @param filepath the file path of the fasta file
#' @param outfile the output file path of the fastq sequence
#' 
#' @export
#' @examples
get_seq_fastq = function(filepath, outfile) {
    ### initialization
    con = file(filepath, "r")
    idx = 1
    
    ### read lines from filepath
    while (TRUE) {
        ### read a line
        line = readLines(con, n = 1)
        
        ### once finish reading -> break
        if (length(line) == 0) {
            break
        } # end if
        
        ### append the sequence to the file
        if (idx %% 4 == 2){
            cat(line, file = outfile, append = "TRUE")
            cat("\n", file = outfile, append = "TRUE")
        } # end if
        
        idx = idx + 1
    } # end while
    close(con)
} # end func