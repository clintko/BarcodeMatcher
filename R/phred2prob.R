#' Convert Phred scores to Error probabilities
#' 
#' convert the phred scores to error probability or log10(error probability)
#' phred = -10log_{10}(\epsilon)
#' 
#' @param phred phred scores
#' @param log_scale whether to get the probability in log10 scale or not
#' 
#' @export
#' @examples
#' phred2prob("BE")  # -3.3 -3.6
#' phred2prob("BE",  log_scale = FALSE) # 0.0005011872 0.0002511886
#' phred2prob("!!!", log_scale = FALSE) # 1 1 1
phred2prob = function(phred, log_scale = TRUE) {
    out = utf8ToInt(phred) - 33
    out = -out / 10
    if (log_scale) {
        return(out)
    } else {
        return(10^out)
    }
    
}