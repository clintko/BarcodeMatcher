#' BarcodeMatcher
#' 
#' My Barcode Matcher
#' 
#' @docType package
#' @author clintko 
#' @import Rcpp
#' @importFrom Rcpp evalCpp
#' @useDynLib BarcodeMatcher
#' @name BarcodeMatcher
NULL 

#' Hello world. Basic Test function
#'
#' @export
#' @examples
#' hello()
hello = function() {
    print("hello")
    print(timesTwo(c(1,2,3)))
}
