#' Extract sequence from fasta file
#' 
#' Read in the fasta file line by line. Discard sequence id and output the sequence
#' 
#' @param filepath the file path of the fasta file
#' @param outfile the output file path of the fasta sequence
#' 
#' @export
#' @examples
get_seq_fasta = function(filepath, outfile) {
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
        if (idx %% 2 == 0){
            cat(line, file = outfile, append = "TRUE")
            cat("\n", file = outfile, append = "TRUE")
        } # end if
        
        idx = idx + 1
    } # end while
    close(con)
} # end func