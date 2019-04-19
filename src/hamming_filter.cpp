#include <Rcpp.h>
#include "tree.h"
using namespace Rcpp;

// [[Rcpp::export]]
void hamming_filter_wrapper(StringVector barcodes, std::string& read, const int threshold) {
    Node *root = new Node();
    Node *curr = new Node();
    std::string base;
    
    for( int idx = 0; idx < barcodes.size(); idx++ ){
        build_tree(root, std::string(barcodes(idx)));
    } // end for
    
    //hamming(root, read);
    hamming_filter_cpp(root, read, threshold);
}


// You can include R code blocks in C++ files processed with sourceCpp
// (useful for testing and development). The R code will be automatically 
// run after the compilation.
//

/*** R
timesTwo(42)
*/
