#' TestDCCRpkg
#' 
#' This function is used to test on DCCRpkg
#' 
#' @docType package
#' @author clintko 
#' @import Rcpp
#' @importFrom Rcpp evalCpp
#' @useDynLib TestDCCRpkg
#' @name TestDCCRpkg
NULL  

#' Hello world. Basic Test function
#'
#' @export
#' @examples
#' hello()
hello = function() {
    library(Rcpp)
    print("hello")
    print(timesTwo(c(1,2,3)))
}